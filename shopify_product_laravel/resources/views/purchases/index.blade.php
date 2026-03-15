@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <h3 class="mb-4">Product Purchase Events (Add to Cart)</h3>
            <div class="card">
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Payment Method</th>
                                <th>Status</th>
                                <th>Date & Time</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($purchases as $purchase)
                                <tr>
                                    <td>{{ ($purchases->currentPage()-1) * $purchases->perPage() + $loop->iteration }}</td>
                                    <td>{{ $purchase->product_name }}</td>
                                    <td>${{ number_format($purchase->price, 2) }}</td>
                                    <td><span class="badge bg-secondary">{{ ucwords(str_replace('_', ' ', $purchase->payment_method)) }}</span></td>
                                    <td>
                                        @if($purchase->status == 'completed')
                                            <span class="badge bg-success">Completed</span>
                                        @elseif($purchase->status == 'pending')
                                            <span class="badge bg-warning">Pending</span>
                                        @else
                                            <span class="badge bg-info">{{ ucfirst($purchase->status) }}</span>
                                        @endif
                                    </td>
                                    <td>{{ $purchase->created_at->format('M d, Y h:i A') }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6" class="text-center">No purchase events recorded yet.</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                    <div class="mt-3">
                        {{ $purchases->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
