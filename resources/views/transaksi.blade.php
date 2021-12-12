@extends('layouts.admin')
@section('title','Data Transaksi')

@section('content')
<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">@yield('title')</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
              <li class="breadcrumb-item active">@yield('title')</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="card">
            <div class="card-header">
              <h3 class="card-title">Tabel @yield('title') Menunggu</h3>
              <a href="" class="btn btn-success float-right" data-target="#add-modal" data-toggle="modal">Tambah Produk</a>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>#</th>
                  <th>Nama Toko</th>
                  <th>Total</th>
                  <th>Bank</th>
                  <th>Status</th>
                  <th style="width: 80px">Aksi</th>
                </tr>
                </thead>
                <tbody>
                  @foreach ($transaksiMenunggu as $no => $d)
                    <tr>
                      <td>{{ $no+1 }}</td>
                      <td>{{ $d->user->nama_toko }}</td>
                      <td>Rp.{{ number_format($d->total_transfer) }}</td>
                      <td>{{ $d->bank }}</td>
                      <td>{{ $d->status }}</td>
                      <td>
                        <a href="{{ route('transaksiProses', $d->id) }}" class="badge badge-success mb-1">
                          Proses
                        </a>
                        <a href="{{ route('transaksiBatal', $d->id) }}" class="badge badge-danger mb-1" >
                          Batal
                        </a>
                      </td>
                    </tr>
                  @endforeach
              </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->

      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="card">
            <div class="card-header">
              <h3 class="card-title">Tabel @yield('title') Selesai</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example2" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>#</th>
                  <th>Total</th>
                  <th>Bank</th>
                  <th>Status</th>
                  <th>Bukti Transfer</th>
                  <th style="width: 20px">Aksi</th>
                </tr>
                </thead>
                <tbody>
                  @foreach ($transaksiSelesai as $no => $d)
                    <tr>
                      <td>{{ $no+1 }}</td>
                      <td>Rp.{{ number_format($d->total_transfer) }}</td>
                      <td>{{ $d->bank }}</td>
                      <td>{{ $d->status }}</td>
                      <td>
                        <a href="{{ asset('storage/transfer/'.$d->bukti_transfer) }}" class="btn btn-primary mb-1">
                          Bukti Transfer
                        </a>
                      </td>
                      <td >
                        @if ($d->status == "DIKIRIM")
                        <a href="{{ route('transaksiSelesai', $d->id) }}" class="btn btn-block btn-primary mb-1">
                          Selesai
                        </a>
                        @elseif ($d->status == "PROSES")
                        <a href="{{ route('transaksiKirim', $d->id) }}" class="btn btn-block btn-success mb-1">
                          Kirim
                        </a>
                        @elseif ($d->status == "SELESAI" || $d->status == "BATAL")                        
                        <a href="{{ route('detailtransaksi', $d->id) }}" class="btn btn-block btn-info mb-1">
                          Detail
                        </a>
                        @elseif ($d->status == "DIBAYAR")                        
                        <a href="{{ route('transaksiKirim', $d->id) }}" class="btn btn-block btn-success mb-1">
                          Proses
                        </a>
                        @endif
                      </td>
                    </tr>
                  @endforeach
              </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

  <div class="modal fade" tabindex="-1" role="dialog" id="add-modal">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Tambah Produk</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form action="{{ route('produk.store') }}" method="post" class="needs-validation" novalidate="" enctype="multipart/form-data">
          @csrf
          <div class="modal-body">

            <div class="form-group">
              <label>Nama</label>
              <input type="text" name="name" id="name" value="{{ old('name') }}"  class="form-control @error('name')
                is-invalid
              @enderror">
              <div class="invalid-feedback">
                @error('name')
                  {{ $message }}
                @enderror
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Harga</label>
                  <input type="text" name="harga" id="harga" value="{{ old('harga') }}"  class="form-control @error('harga')
                    is-invalid
                  @enderror">
                  <div class="invalid-feedback">
                    @error('harga')
                      {{ $message }}
                    @enderror
                  </div>
                </div>
              </div>

              <div class="col-md-6">
                <div class="form-group">
                  <label>Kategori</label>
                  <select name="kategori_id" id="kategori_id" class="form-control @error('kategori_id')
                    is-invalid
                  @enderror">
                    <option value="">No Selected</option>
                    <option value="1">Kategori 1</option>
                  </select>
                  <div class="invalid-feedback">
                    @error('kategori_id')
                      {{ $message }}
                    @enderror
                  </div>
                </div>
              </div>
            </div>

            <div class="form-group">
              <label for="deskripsi">Deskripsi</label>
              <textarea name="deskripsi" id="deskripsi" cols="30" rows="5" class="form-control @error('deskripsi')
                    is-invalid
                  @enderror"></textarea>
              <div class="invalid-feedback">
                @error('kategori_id')
                  {{ $message }}
                @enderror
              </div>
            </div>

            <div class="form-group">
              <label for="image">Upload Gambar</label>
              <div class="input-group">
                <div class="custom-file">
                  <input type="file" class="custom-file-input @error('image')
                    is-invalid
                  @enderror" name="image">
                  <label for="image" class="custom-file-label">Pilih file</label>
                </div>
              </div>

              <div class="invalid-feedback">
                @error('image')
                  {{ $message }}
                @enderror
              </div>
            </div>

          </div>
          <div class="modal-footer bg-whitesmoke br">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
            <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button>
          </div>
        </form>
      </div>
    </div>
  </div>
@endsection
@push('page-scripts')

<script>
  @if ($errors->any())
    $('#add-modal').modal('show')
  @endif
  $(function () {
    $("#example1").DataTable();
  });
  $(function () {
    $("#example2").DataTable();
  });
  $(document).ready(function () {
    bsCustomFileInput.init();
  });
</script>
    
@endpush
