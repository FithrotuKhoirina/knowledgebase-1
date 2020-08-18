---
title: "Release and Deployment Civet"
date: "2019-11-25"
document type: "6"
author: "Shindy Farrahdiba"
summary: "Dokumen ini penjelasan langkah melakukan proses release dan deployment dari Civet"
---



# Release dan Deployment

## Schedule and Steps

### **Production Release Step:**

**Don'ts:**

1. Tidak membuat *Pull Request* setelah *task* diterima oleh QA.
2. Jangan *merge* PR untuk “pre-release” tanpa konfirmasi kepada orang yang membuat *release*.
3. *Unprotected branch* "Master" and "Pre-release".

**Do's:**

1. Setiap SE (Software Engineer) harus membuat *Pull Request* untuk “release” *branch* setelah *task* diterima oleh QA.
2. A.S.A.P untuk no.1
3. Release Person, harus membuat *release notes* untuk setiap *task* yang siap untuk *release*
    1. Minimal sehari penuh sebelum jadwal *release*, *release* harus dilakukan
    2. Periksa semua PR
    3. *Merge* PR *task* satu per satu menjadi “pre-release”
    4. Jika ada *conflict* : *resolve it*. Jika tidak yakin, berkoordinasi dengan SE yang bekerja untuk *task* itu.
    5. Setelah semua berhasil di-*merge* menjadi “pre-release” : Buat **RELEASE DRAFT** on github. Tandai *tag* untuk nomor versi: 1.x.x ( *major, medium, single-task*)
    6. Finalisasi *release* dari langkah no. 5
    7. Lakukan PR dari “pre-release” ke *branch* “master”
    8. Peringatan : Semua PR *MERGED INTO MASTER WILL BE RELEASED TO PRODUCTION* (kecuali untuk beberapa repo, yaitu: Terra)   


### **Development & UAT Release**

1. Semua langkah sama untuk *release guide* sebelumnya
2. Kecuali:
    1. Tidak perlu membuat *Tag release*
    2. Merge ke *branch* “development” untuk *deploy* ke *development server*

# Deployment

Jadwal *development* tentatif, idealnya *release* harus di-*deploy* sebelum *Sprint Review*. Jika tidak memungkinkan, *release* harus digunakan dalam rentang *sprint* sesudahnya.