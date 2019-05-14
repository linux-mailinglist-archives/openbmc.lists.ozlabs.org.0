Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE911C609
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 11:27:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453C5Y6VDzzDqGS
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 19:27:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::243; helo=mail-oi1-x243.google.com;
 envelope-from=leetroy@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PaEiqajN"; 
 dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453C4b6fnYzDqF1;
 Tue, 14 May 2019 19:26:54 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id y10so11561870oia.8;
 Tue, 14 May 2019 02:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=naJ0NY85fax6NxaZlrfRQB9vqNw3QoxvkG/s27NBzcs=;
 b=PaEiqajNwiIZcqUk7kb85q/2xkUh47CijFFjAdzEPY6FxUhTadmjG4KSe8UpN6r7LK
 mXVy6vRMQ72kqnJo6PKK6c/V4JrnJKwgF4BsI6PKuqaI71ZF7IM9ALzgBmm/NUXm9zgT
 ITEhP+lKselYjGBbhrrEAbVK3r1ZIkG/Twp2pWzIa7MGyh4ugDroSFZo2kzoiKwNZiA4
 qTr8WzkXuv1wi/S7S2aWwJMD3feLn8dv7DLqOefQJHgOD1DbNAiGQ/hT6HOUFiYUG74F
 Ftrup32UCF8mtTP4NPxQx6NPzcMJMNnracSxh9qfO6PK3e5GvEtAHcvu171mOOqoV5/6
 193g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=naJ0NY85fax6NxaZlrfRQB9vqNw3QoxvkG/s27NBzcs=;
 b=ldKlc+OoucYeD4YELkMYDmZIjkGZGmgoq+rjip8rWkD1drPOW8Y4gNudjr2MWwZcXb
 kYAS1ZSGd4sEkiSUZZKMiCZ4mxb+5EY/RJ/Mfb829J26JMy2EozTXQcjkm+etReskGn5
 VzIEdFbOuNs9+xhMPb4D7lG1XTm55u5ZmZOFroptKjQEzee1vqYEkkWwDOP7U0bPP/nA
 YWhN+xaY1F0yQQeF51O55NyFsRYmAP5sorJBd1GAey3hJr4hsGGv1YjVb9WXzLk3xClJ
 41rVPZqsjBiXlvRDSQ8oxLqlHGtODAO0/yUmekAyb2gen3RSSNf7ksguE+8u6uT+4+Nh
 dCbg==
X-Gm-Message-State: APjAAAU1A8siUsFmtsjNPvp+Z31m/rV1tmLRT4AwLIFDdDyu17IsjvTq
 T7IyuRK0Wxra3dWBhIHRRIOT4iOj+01LD/oYiZs=
X-Google-Smtp-Source: APXvYqzaK/QYVrrduoCvWyRETo6TirRRyxFmI0VcU2yyi1orC59TvzOTLPi6rajxN6nwsoW8UOIpM34nDJPqPb8JPpg=
X-Received: by 2002:aca:4bd6:: with SMTP id y205mr2272049oia.80.1557826012681; 
 Tue, 14 May 2019 02:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAN9Jwz1wvT0nhoTb8K9Qf-MTARc3q8kxRQXSH1TCA0e5nJFY4w@mail.gmail.com>
 <CAARXrtkqY+vLUsUmDMiL4o+ZpP4whAtRiqFB5At_PhR7dFD7hQ@mail.gmail.com>
 <eb00da838abbb81aff67bb883681e927@linux.vnet.ibm.com>
In-Reply-To: <eb00da838abbb81aff67bb883681e927@linux.vnet.ibm.com>
From: Troy Lee <leetroy@gmail.com>
Date: Tue, 14 May 2019 17:26:40 +0800
Message-ID: <CAN9Jwz0P=L_AA2Ou74qY+b8gyytQn0FuwCRyTLuOPizEBob+BA@mail.gmail.com>
Subject: Re: How to deal with incorrect firmware image in
 phosphor-bmc-code-mgmt?
To: Adriana Kobylak <anoo@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Greeting,

Apologize for delayed reply.

Since it would not be possible to obtain the percentage of TFTP transmissio=
n.
It would be nice to know when does TFTP transmission completed.

The current behavior, we observed, has slightly different.
Before we upload the image, the BMC.Update has the entry of current
activated software, but not the Software.Version.
After we upload the image into /tmp/images, the entry of
Software.Version is generated, and BMC.Update remain the same as
before.

- We're not able to activate the version from BMC.Updater, because it
is already activated. (Expected)
- We're not able to deleted the version from Software.Version and
/tmp/images, because the delete method is not working if the version
is currently activated.
  Then the image is laying in /tmp/images until next reboot. (Unexpected)
  https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/991af7ecfb579e7261=
3b6c2ab5036a4dc7834636/item_updater.cpp#L233-L246


## Before uploading the image
```
root@romulus:~# busctl tree xyz.openbmc_project.Software.BMC.Updater --no-p=
age
=E2=94=94=E2=94=80/xyz
  =E2=94=94=E2=94=80/xyz/openbmc_project
    =E2=94=94=E2=94=80/xyz/openbmc_project/software
      =E2=94=94=E2=94=80/xyz/openbmc_project/software/02faf2c1
root@romulus:~# busctl tree xyz.openbmc_project.Software.Version --no-page
=E2=94=94=E2=94=80/xyz
  =E2=94=94=E2=94=80/xyz/openbmc_project
    =E2=94=94=E2=94=80/xyz/openbmc_project/software
```

## After uploading the image has the same version ID
```
root@romulus:~# busctl tree xyz.openbmc_project.Software.BMC.Updater --no-p=
age
=E2=94=94=E2=94=80/xyz
  =E2=94=94=E2=94=80/xyz/openbmc_project
    =E2=94=94=E2=94=80/xyz/openbmc_project/software
      =E2=94=94=E2=94=80/xyz/openbmc_project/software/02faf2c1
root@romulus:~# busctl tree xyz.openbmc_project.Software.Version --no-page
=E2=94=94=E2=94=80/xyz
  =E2=94=94=E2=94=80/xyz/openbmc_project
    =E2=94=94=E2=94=80/xyz/openbmc_project/software
      =E2=94=94=E2=94=80/xyz/openbmc_project/software/02faf2c1

root@romulus:~# busctl call xyz.openbmc_project.Software.Version
/xyz/openbmc_project/software/02faf2c1
xyz.openbmc_project.Object.Delete Delete
May 14 17:10:06 romulus phosphor-version-software-manager[1180]:
Error: Version 02faf2c1 is currently running on the BMC. Unable to
remove.

root@romulus:~# busctl tree xyz.openbmc_project.Software.Version --no-page
=E2=94=94=E2=94=80/xyz
  =E2=94=94=E2=94=80/xyz/openbmc_project
    =E2=94=94=E2=94=80/xyz/openbmc_project/software
      =E2=94=94=E2=94=80/xyz/openbmc_project/software/02faf2c1
root@romulus:~# ls /tmp/images
02faf2c1
root@romulus:~# ls /tmp/images/02faf2c1/
MANIFEST          image-kernel      image-rofs        image-rwfs
 image-u-boot      publickey
MANIFEST.sig      image-kernel.sig  image-rofs.sig    image-rwfs.sig
 image-u-boot.sig  publickey.sig
```

Thanks,
Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>

Adriana Kobylak <anoo@linux.ibm.com> =E6=96=BC 2019=E5=B9=B45=E6=9C=8814=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:32=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 2019-05-08 03:56, Lei YU wrote:
> > On Wed, May 8, 2019 at 4:37 PM Troy Lee <leetroy@gmail.com> wrote:
> >>
> >> Greeting,
> >>
> >> With the method xyz.openbmc_project.Common.TFTP.DownloadViaTFTP,
> >> does OpenBMC have a way to know that TFTP download status(completed)
> >> and the downloaded image is incorrect?
>
> The challenge is the time that takes to perform the TFTP transfer. A
> transfer from a remote server can take minutes to complete, which would
> cause timeouts on the REST server. If we can solve this, then we could
> return a download status.
> See issue for reference : https://github.com/openbmc/openbmc/issues/1691
>
> >>
> >> It would not be a problem if the image is correct, since we'll have an
> >> InterfacesAdded signal.
> >> But if the image is incorrect (untar failure/signature mismatch),
> >> we'll only have an error log entry generated.
> >
> > What is the expected behavior if the image is incorrect?
> >
> >> Or if the image has the same version id with currently running image,
> >> the behavior will become unexpected.
> >
> > I met this problem before, and I think we may discuss the expected
> > behavior,
> > and fix this case.
> >
>
> The current behavior is that a new Version D-Bus object is not created
> because one already exists. If this is unexpected, what should the
> expected
> behavior be?
>
> >>
> >> Because we have another service wants to integrate with firmware
> >> update service, having a way to confirm the image file is nice to
> >> have.
> >>
> >> Thanks,
> >> Troy Lee
> >> --
> >> Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
>
