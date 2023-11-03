<?php
//cek session
if (empty($_SESSION['admin'])) {
    $_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
    header("Location: ./");
    die();
} else {

    echo '
        <style type="text/css">
            table {
                background: #fff;
                padding: 5px;
            }
            tr, td {
                border: table-cell;
                border: 1px  solid #444;
            }
            tr,td {
                vertical-align: top!important;
            }
            #right {
                border-right: none !important;
            }
            #left {
                border-left: none !important;
            }
            .isi {
                height: 300px!important;
            }
            .disp {
                text-align: center;
                padding: 1.5rem 0;
                margin-bottom: .5rem;
            }
            .logodisp {
                float: left;
                position: relative;
                width: 110px;
                height: 110px;
                margin: 0 0 0 1rem;
            }
            #lead {
                width: auto;
                position: relative;
                margin: 25px 0 0 75%;
            }
            .lead {
                font-weight: bold;
                text-decoration: underline;
                margin-bottom: -10px;
            }
            .tgh {
                text-align: center;
            }
            #nama {
                font-size: 2.1rem;
                margin-bottom: -1rem;
            }
            #alamat {
                font-size: 16px;
            }
            .up {
                text-transform: uppercase;
                margin: 0;
                line-height: 2.2rem;
                font-size: 1.5rem;
            }
            .status {
                margin: 0;
                font-size: 1.3rem;
                margin-bottom: .5rem;
            }
            #lbr {
                font-size: 20px;
                font-weight: bold;
            }
            .separator {
                border-bottom: 2px solid #616161;
                margin: -1.3rem 0 1.5rem;
            }
            @media print{
                body {
                    font-size: 12px;
                    color: #212121;
                }
                nav {
                    display: none;
                }
                table {
                    width: 100%;
                    font-size: 12px;
                    color: #212121;
                }
                tr, td {
                    border: table-cell;
                    border: 1px  solid #444;
                    padding: 8px!important;

                }
                tr,td {
                    vertical-align: top!important;
                }
                #lbr {
                    font-size: 20px;
                }
                .isi {
                    height: 200px!important;
                }
                .tgh {
                    text-align: center;
                }
                .disp {
                    text-align: center;
                    margin: -.5rem 0;
                }
                .logodisp {
                    float: left;
                    position: relative;
                    width: 70px;
                    height: 70px;
                    margin: .5rem 0 0 .5rem;
                }
                #lead {
                    width: auto;
                    position: relative;
                    margin: 15px 0 0 75%;
                }
                .lead {
                    font-weight: bold;
                    text-decoration: underline;
                    margin-bottom: -10px;
                }
                #nama {
                    font-size: 20px!important;
                    font-weight: bold;
                    text-transform: uppercase;
                    margin: -10px 0 -20px 0;
                }
                .up {
                    font-size: 17px!important;
                    font-weight: normal;
                }
                .status {
                    font-size: 17px!important;
                    font-weight: normal;
                    margin-bottom: -.1rem;
                }
                #alamat {
                    margin-top: -15px;
                    font-size: 13px;
                }
                #lbr {
                    font-size: 17px;
                    font-weight: bold;
                }
                .separator {
                    border-bottom: 2px solid #616161;
                    margin: -1rem 0 1rem;
                }

            }
        </style>

        <body onload="window.print()">

        <!-- Container START -->
            <div id="colres">
                <div class="disp">';
    $query2 = mysqli_query($config, "SELECT institusi, nama, alamat, logo FROM tbl_instansi");
    list($institusi, $nama, $alamat, $logo) = mysqli_fetch_array($query2);
    echo '<img class="logodisp" src="./upload/' . $logo . '"/>';
    echo '<h6 class="up">' . $institusi . '</h6>';
    echo '<h5 class="up" id="nama">' . $nama . '</h5><br/>';
    echo '<span id="alamat">' . $alamat . '</span>';

    echo '
                </div>
                <div class="separator"></div>';

    $id_surat = mysqli_real_escape_string($config, $_REQUEST['id_surat']);
    $query = mysqli_query($config, "SELECT * FROM tbl_surat_masuk WHERE id_surat='$id_surat'");

    if (mysqli_num_rows($query) > 0) {
        $no = 0;
        while ($row = mysqli_fetch_array($query)) {

            echo '
                <h5 class="tgh" style="font-weight: bold"><u>LEMBARAN DISPOSISI</u></h5>
                    <table class="bordered" id="tbl">
                        <tbody>
                            <tr>
                                <td id="right" width="18%"><strong>INDEKS</strong></td>
                                <td id="left" style="border-right: none;" width="40%" height="70px">: ' . $row['indeks'] . '</td>
                                <td id="right" class="tgh"><strong>TANGGAL PENYELESAIAN : </strong></td>
                            </tr>
                           
                            <tr>
                            <tr>
                                <td id="right"><strong>Perihal</strong></td>
                                <td id="left" colspan="2">: ' . $row['isi'] . '</td>
                            </tr>   
                            </tr>                        
                            <tr>
                                <td id="right"><strong>TANGGAL/NO</strong></td>
                                <td id="left" style="border-right: none;">: ' . indoDate($row['tgl_diterima']) . '</td>
                                <td id="left" style="border-left: none;"><strong>Nomor: </strong>' . $row['no_surat'] . '</td>
                            </tr>
                            <tr>
                                <td id="right"><strong>ASAL</strong></td>
                                <td id="left" colspan="2">: ' . $row['asal_surat'] . '</td>
                            </tr>
                            <tr>';
            $query3 = mysqli_query($config, "SELECT * FROM tbl_disposisi JOIN tbl_surat_masuk ON tbl_disposisi.id_surat = tbl_surat_masuk.id_surat WHERE tbl_disposisi.id_surat='$id_surat'");

            if (mysqli_num_rows($query3) > 0) {
                $no = 0;
                $row = mysqli_fetch_array($query3); {
                    echo '
                            <tr class="isi">
                                <td colspan="2">
                                    <strong>INSTRUKSI/INFORMASI x):</strong><br/>' . $row['isi_disposisi'] . '
                                    <div style="height: 130px;"></div>
                                    <strong>BATAS WAKTU</strong> : ' . indoDate($row['batas_waktu']) . '<br/>
                                    <strong>SIFAT</strong> : ' . $row['sifat'] . '<br/>
                                    <strong>CATATAN</strong> :<br/> ' . $row['catatan'] . '
                                    <div style="height: 50px;"></div>
                                </td>
                                <td><strong>DITETAPKAN KEPADA</strong> : <br/>' . $row['tujuan'] . '</td>
                            </tr>
                            <tr>
                                <td colspan="3" id="left"><strong>x) 1. Kepada bawahan "Instruksi" dan atau "Informasi" <br> &nbsp&nbsp&nbsp&nbsp 2. Kepada atasan "Informasi" coret "Instruksi"</strong>
                                </td>
                            </tr>';
                }
            } else {
                echo '
                                <tr class="isi">
                                    <td colspan="2"><strong>INSTRUKSI/INFORMASI x):</strong>
                                    </td>
                                    <td><strong>DITETAPKAN KEPADA</strong> : </td>
                                </tr>
                                <tr>
                                <td colspan="3" id="left"><strong>x) 1. Kepada bawahan "Instruksi" dan atau "Informasi" <br> &nbsp&nbsp&nbsp&nbsp 2. Kepada atasan "Informasi" coret "Instruksi"</strong>
                                </td>
                            </tr>';
            }
        }
        echo '
                </tbody>
            </table>
            
    <!-- Container END -->

    </body>';
    }
}
