Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF755377A7
	for <lists+openbmc@lfdr.de>; Mon, 30 May 2022 11:26:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBVRH2BFlz3bk4
	for <lists+openbmc@lfdr.de>; Mon, 30 May 2022 19:26:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EADepXHv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=gangadhar.ubuntu@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EADepXHv;
	dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBVQq1WhVz308b
	for <openbmc@lists.ozlabs.org>; Mon, 30 May 2022 19:26:25 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id l10-20020a9d7a8a000000b0060b151de434so7360653otn.2
        for <openbmc@lists.ozlabs.org>; Mon, 30 May 2022 02:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=UyqVOlz00Bf7KtcaRdNqlGoZprQPeHSNbqmNCftC7Vg=;
        b=EADepXHvNgZ9x5mKl8cnJIOYenR/pY75Ba2mxuNnWanR/3Y5IyY76AtnWbmjRLxLrX
         6m4b3HTaQcB5jcs07rbVwIefJtS0vEgAFBLriHpitNahbFtJdSZ9D0rz9woYsEZQ5D8P
         bLTfPUhNfA43tnH+A7/OQPEx1oHRdjQnr5Qx7uT/3gFILQiPDHBUhD83AWp84PXiF6mw
         1yCIgWGex+LkIGHscka/pjUpIMcpOPwxsDb5wGX4U1BGmWUkNX3dKSEUK4lEf1chOF4K
         iye+BZlGdC7+iQ5mkFqLdeez98emB5s6T2KP8HfKbEJtZk43ZI1FpGoIqR+g0GMkSDwo
         r/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=UyqVOlz00Bf7KtcaRdNqlGoZprQPeHSNbqmNCftC7Vg=;
        b=imNA6p+sJ9m9qPRY7H2u65KEQQRmkBRIfFA7AACNj5/MJuNMnHO51vWXc4r/cOspWi
         7Vv5NzkkpVcaI2ox5dHH4AF7IZkoQjdUHkCfJu532ohYg1HE3j+yGh/Eg714XAJYjByG
         4rxLGHjlnKkfOg7JPdnDgSzrt9Qius0u91FcKksvM/sOsYF5jDDeTD9Q9dhieIOtH66N
         CSK6Qf6UGS02YnyUxlMPoJYTfW/Wvzr4eUuS1KAGdYYRFKUHr9SNjXkLhYo1Y2vrSoOv
         jM9TjU9INtFWNxDjGCyqp3sS3dilRQNoGjQXcWPbpQZkzCO3qIHR+vy8YzK4OmPKu23s
         b1vQ==
X-Gm-Message-State: AOAM533Rl9klXedEeJFIad+2OyWSPXB1jETc9wHfO+sUjb6KAkdpQKaj
	cXsAnAea9frdoJlTDcpZlOmYv/teP4QylI7nPZA2BVbUf4nvYw==
X-Google-Smtp-Source: ABdhPJxMt9L3C5VE1ROqKQdx7rEJga5gc6jktXCooPZd1K9DxaL7tViZv4f87dXk7vwLH5M3aDe5QF3oXc5VK6L5Dl0=
X-Received: by 2002:a05:6830:2a16:b0:60a:f64d:ae2d with SMTP id
 y22-20020a0568302a1600b0060af64dae2dmr17407187otu.331.1653902781457; Mon, 30
 May 2022 02:26:21 -0700 (PDT)
MIME-Version: 1.0
From: Gangadhar N <gangadhar.ubuntu@gmail.com>
Date: Mon, 30 May 2022 14:56:10 +0530
Message-ID: <CAKxnL=hnWt8ZYL2eU8yaYMRTF7wMO8asb_YLmY2361CWddMkXg@mail.gmail.com>
Subject: Usage of SHA384 signature for FIT image instead of SHA256
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000c8292005e0373ff2"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c8292005e0373ff2
Content-Type: text/plain; charset="UTF-8"

Hi All,
I am facing an issue while using SHA384 signature for FIT image instead of
SHA256. I get build errors.

ERROR: linux-obmc-5.8.17+gitAUTOINC+c26e1233f9-r0 do_assemble_fitimage:
Execution of
'/home/gangadhar/openbmc/build/tmp/work/linux-gnueabi/linux-obmc/5.8.17+gitAUTOINC+c26e1233f9-r0/temp/run.do_assemble_fitimage.17762'
failed with exit code 255:
none
fit-image.its:8.26-20.19: Warning (unit_address_vs_reg): /images/kernel@1:
node has a unit name, but no reg property
fit-image.its:17.32-19.27: Warning (unit_address_vs_reg): /images/kernel@1
/hash@1: node has a unit name, but no reg property
fit-image.its:21.29-31.19: Warning (unit_address_vs_reg): /images/fdt@...:
node has a unit name, but no reg property
fit-image.its:28.32-30.27: Warning (unit_address_vs_reg): /images/fdt@
.../hash@1: node has a unit name, but no reg property
fit-image.its:36.30-50.19: Warning (unit_address_vs_reg):
/configurations/conf@...: node has a unit name, but no reg property
fit-image.its:42.32-44.27: Warning (unit_address_vs_reg):
/configurations/conf@.../hash@1: node has a unit name, but no reg property
fit-image.its:45.37-49.27: Warning (unit_address_vs_reg):
/configurations/conf@.../signature@1: node has a unit name, but no reg
property
uboot-mkimage Can't add hashes to FIT blob: -93
Unsupported hash algorithm (sha384) for 'hash@1' hash node in 'kernel@1'
image node
WARNING: exit code 255 from a shell command.

Yocto changes that I have done,

diff --git a/poky/meta/classes/kernel-fitimage.bbclass
b/poky/meta/classes/kernel-fitimage.bbclass
index bb2f3c4cc..d4f9dddf2 100644
--- a/poky/meta/classes/kernel-fitimage.bbclass
+++ b/poky/meta/classes/kernel-fitimage.bbclass
@@ -51,13 +51,13 @@ python __anonymous () {
 UBOOT_MKIMAGE_DTCOPTS ??= ""

 # fitImage Hash Algo
-FIT_HASH_ALG ?= "sha256"
+FIT_HASH_ALG ?= "sha384"

 # fitImage Signature Algo
 FIT_SIGN_ALG ?= "rsa2048"

 # Generate keys for signing fitImage
-FIT_GENERATE_KEYS ?= "0"
+FIT_GENERATE_KEYS ?= "1"

 # Size of private key in number of bits
 FIT_SIGN_NUMBITS ?= "2048"

Thanks & Regards,
Gangadhar

--000000000000c8292005e0373ff2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div>I am facing an issue while using SHA384 signat=
ure for FIT image instead of SHA256. I get build errors.</div><div><br></di=
v><div><div style=3D"box-sizing:border-box;color:rgb(51,51,51);font-family:=
&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:14px">ERROR=
: linux-obmc-5.8.17+gitAUTOINC+c26e1233f9-r0 do_assemble_fitimage: Executio=
n of &#39;/home/gangadhar/openbmc/build/tmp/work/linux-gnueabi/linux-obmc/5=
.8.17+gitAUTOINC+c26e1233f9-r0/temp/run.do_assemble_fitimage.17762&#39; fai=
led with exit code 255:<br style=3D"box-sizing:border-box">none<br style=3D=
"box-sizing:border-box">fit-image.its:8.26-20.19: Warning (unit_address_vs_=
reg): /images/kernel@1: node has a unit name, but no reg property<br style=
=3D"box-sizing:border-box">fit-image.its:17.32-19.27: Warning (unit_address=
_vs_reg): /images/kernel@1/hash@1: node has a unit name, but no reg propert=
y<br style=3D"box-sizing:border-box">fit-image.its:21.29-31.19: Warning (un=
it_address_vs_reg): /images/fdt@...: node has a unit name, but no reg prope=
rty<br style=3D"box-sizing:border-box">fit-image.its:28.32-30.27: Warning (=
unit_address_vs_reg): /images/fdt@.../hash@1: node has a unit name, but no =
reg property<br style=3D"box-sizing:border-box">fit-image.its:36.30-50.19: =
Warning (unit_address_vs_reg): /configurations/conf@...: node has a unit na=
me, but no reg property<br style=3D"box-sizing:border-box">fit-image.its:42=
.32-44.27: Warning (unit_address_vs_reg): /configurations/conf@.../hash@1: =
node has a unit name, but no reg property<br style=3D"box-sizing:border-box=
">fit-image.its:45.37-49.27: Warning (unit_address_vs_reg): /configurations=
/conf@.../signature@1: node has a unit name, but no reg property<br style=
=3D"box-sizing:border-box">uboot-mkimage Can&#39;t add hashes to FIT blob: =
-93<br style=3D"box-sizing:border-box">Unsupported hash algorithm (sha384) =
for &#39;hash@1&#39; hash node in &#39;kernel@1&#39; image node<br style=3D=
"box-sizing:border-box">WARNING: exit code 255 from a shell command.</div><=
/div><div><br></div><div>Yocto changes that I have done,</div><div><br></di=
v><div><div style=3D"box-sizing:border-box;color:rgb(51,51,51);font-family:=
&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:14px">diff =
--git a/poky/meta/classes/kernel-fitimage.bbclass b/poky/meta/classes/kerne=
l-fitimage.bbclass<br style=3D"box-sizing:border-box">index bb2f3c4cc..d4f9=
dddf2 100644<br style=3D"box-sizing:border-box">--- a/poky/meta/classes/ker=
nel-fitimage.bbclass<br style=3D"box-sizing:border-box">+++ b/poky/meta/cla=
sses/kernel-fitimage.bbclass<br style=3D"box-sizing:border-box">@@ -51,13 +=
51,13 @@ python __anonymous () {<br style=3D"box-sizing:border-box">=C2=A0U=
BOOT_MKIMAGE_DTCOPTS ??=3D &quot;&quot;<br style=3D"box-sizing:border-box">=
<br style=3D"box-sizing:border-box">=C2=A0# fitImage Hash Algo<br style=3D"=
box-sizing:border-box">-FIT_HASH_ALG ?=3D &quot;sha256&quot;<br style=3D"bo=
x-sizing:border-box">+FIT_HASH_ALG ?=3D &quot;sha384&quot;<br style=3D"box-=
sizing:border-box"><br style=3D"box-sizing:border-box">=C2=A0# fitImage Sig=
nature Algo<br style=3D"box-sizing:border-box">=C2=A0FIT_SIGN_ALG ?=3D &quo=
t;rsa2048&quot;<br style=3D"box-sizing:border-box"><br style=3D"box-sizing:=
border-box">=C2=A0# Generate keys for signing fitImage<br style=3D"box-sizi=
ng:border-box">-FIT_GENERATE_KEYS ?=3D &quot;0&quot;<br style=3D"box-sizing=
:border-box">+FIT_GENERATE_KEYS ?=3D &quot;1&quot;<br style=3D"box-sizing:b=
order-box"><br style=3D"box-sizing:border-box">=C2=A0# Size of private key =
in number of bits<br style=3D"box-sizing:border-box">=C2=A0FIT_SIGN_NUMBITS=
 ?=3D &quot;2048&quot;</div><div style=3D"box-sizing:border-box;color:rgb(5=
1,51,51);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;=
font-size:14px"><br style=3D"box-sizing:border-box"></div><div style=3D"box=
-sizing:border-box;color:rgb(51,51,51);font-family:&quot;Helvetica Neue&quo=
t;,Helvetica,Arial,sans-serif;font-size:14px">Thanks &amp; Regards,</div><d=
iv style=3D"box-sizing:border-box;color:rgb(51,51,51);font-family:&quot;Hel=
vetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:14px">Gangadhar</div=
></div></div>

--000000000000c8292005e0373ff2--
