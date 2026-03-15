@extends('layouts.app')

@section('content')
 <div class="container-fluid">
            <!--begin::Row-->
            <div class="row">
              <div class="col-sm-6 text-end">
                <a href="{{ route('products.create') }}" class="btn btn-primary">Add Product</a>
              </div>

               <!-- /.card-header -->
                  <div class="card-body" style="margin-top: 10px; margin-bottom: 20px;">
                    @if(session('success'))
                        <div class="alert alert-success">{{ session('success') }}</div>
                    @endif
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <th style="width: 10px">SN</th>
                          <th>Product Name</th>
                          <th>Product Image</th>
                          <th>Product Price</th>
                          <th>Product View</th>
                          <th>Status</th>
                          <th style="width: 150px">Actions</th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach($products as $key => $product)
                        <tr>
                        <td>{{ $key + 1 }}</td>
                        <td>{{ $product->product_name }}</td>
                        <td>
                            <img
                                src="{{ url('assets/img/'.$product->image_url) }}"
                                alt="{{ $product->product_name }}"
                                width="100"
                                height="80"
                                style="object-fit: cover; border-radius: 5px;"
                            >
                        </td>
                        <td>${{ number_format($product->price, 2) }}</td>
                        <td>{{ $product->views_count }}</td>
                        <td>
                            @if($product->status == 'active')
                                <span class="badge bg-success">Active</span>
                            @else
                                <span class="badge bg-danger">Inactive</span>
                            @endif
                        </td>
                        <td>
                            <a href="{{ route('products.edit', $product->id) }}" class="btn btn-sm btn-info">Edit</a>
                            <form action="{{ route('products.destroy', $product->id) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                      @endforeach
                      </tbody>
                    </table>
                  </div>
                  <!-- /.card-body -->
            </div>
            <!--end::Row-->
          </div>
@endsection
