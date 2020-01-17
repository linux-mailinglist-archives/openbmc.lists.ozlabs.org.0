Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC14140827
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 11:43:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zd2905JnzDqmb
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 21:43:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=asmithakarun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ffWYPhkx; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zd1Q5KzqzDqnv
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 21:42:31 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id y17so22216648wrh.5
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 02:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=H+SbkAmBy1gK7yDEkm8ZuEEW/N5WlK0BVO1jWdJRTrY=;
 b=ffWYPhkxz+2/BdCtJnBS4dOnRGtHYmUfxnGyLJYv6PPwufP4ZXPS2TpmjZHVsCnIGw
 Cj7lqdYLqN7bHEYw23McrwKXBm++nQGo/gsB92wrBfL0gTkZzU+ew7IwZpXFCicdy34+
 4rTpG4goZcB/AvUmWzPfL5coQIeAmYlHaa98LqIKVomtNgWHERU1X9Lms8XI/QkmVQB7
 lvVEcYnVElyn1AfVIcHULowTHbTWjgfhexX7iorCv2RTpZYrdBuWW3kKSf2aw25A8M3M
 zGAfZG/7Lb/u0xkCHrsrnaqESuJ5T8iPj64WEAmKkxWE7MdaKmVuGLWbhO/5zPl2U4RP
 epXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=H+SbkAmBy1gK7yDEkm8ZuEEW/N5WlK0BVO1jWdJRTrY=;
 b=EAxBKL4nZAem9WQ67Jt6KceM1ElZEkrsCbIBXnNZ7AxAp5PiFPQqA0PEzRMi9vwymX
 Bddj6kwVJPZ9U56f9dNYirs6xnaUMo/Mhe7MuesPV2r9ClN0m3fzBa0yOc/FI1wNvOMu
 0Yy7IKiNaKj18tjYSZRzXiP5QM3B8gU63+KCdRYvrMgYxxT4qbT/rqyodGCyqCQDIbkz
 4vlJ4Nv877qR4ckcsP87GRv21FDz3G2omn8GdEw0SyM7Gfi98AuVMC4oohnL+wAoMI+C
 hLkveBDThhBcwxdzPo5DtykQFTZUQwOMQM+yDVEvycSGAyuB+ZcUUAxE0SfE15szvyoH
 +uSQ==
X-Gm-Message-State: APjAAAVfP0Z4GjnIyye8Cz/CZseN8apb9G9FMmu2065ZAHyHEMmKYgBS
 ZiRDWn2aIIbybbNZ/+4aqJdl1zLLpVlDixWeEihPdGxS8vs=
X-Google-Smtp-Source: APXvYqxOgcNXxwWlImmw4DqGTUL3Wk98J/ySs/A3BKOHwa4ZtyjwZxONfQoa0xlTaF0dAPpI7HzQ+w8HedNjqQMWfFw=
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr2282146wrw.31.1579257744442; 
 Fri, 17 Jan 2020 02:42:24 -0800 (PST)
MIME-Version: 1.0
From: Asmitha Karunanithi <asmithakarun@gmail.com>
Date: Fri, 17 Jan 2020 16:11:45 +0530
Message-ID: <CANGK-S4vcQ9P_fW6ev9h83=GRLCEDr9KeFH2gt-soQ9JpaY_Kw@mail.gmail.com>
Subject: Library to aid multi-part form data parsing
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000ddcb8f059c539893"
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

--000000000000ddcb8f059c539893
Content-Type: text/plain; charset="UTF-8"

Hi All,

There was a requirement to parse multipart form data during file upload for
the vendor-specific interface.

The Curl command for multiple file upload will be:

"curl -c cjar -b cjar -k -H "Content-Type: multipart/form-data" -H
"X-Auth-Token: $bmc_token" -F 'sa1=@/path/to/file1' -F sa2=@/path/to/file2'
-X POST https://$bmc/ibm/v1/files/partitions/"

The above multipart request contains the file contents separated by a
boundary and each file contains the filename, Content-Type and
Content-Disposition.

There were few considerations for this and after testing those libraries,
the mimetic library seemed to fit for this purpose. Please refer to
https://github.com/LadislavSopko/mimetic

Only a part of code from this library is used for this purpose (which is
under "mimetic" folder in this repo).

Regression tests were conducted with that part of the library that is being
used for multi-part parsing, as a part of which there was no memory leakage
found after firing a large number of requests (2000 requests in this case).

There was a difference of 71.68 KB in the openbmc flash size when this
library is pulled. The mimetic shared object files are used from
mimetic/codec/.libs.

If there are other suggestions for the multi-part form data parsing or if
there are suggestions for any other test that needs to be done, please post
in the suggestions.

-- 
Thanks & Regards,
Asmitha Karunanithi

--000000000000ddcb8f059c539893
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>There was a requirement to pars=
e multipart form data during file upload for the vendor-specific interface.=
<br></div><div><br></div><div>The Curl command for multiple file upload wil=
l be:</div><div><br></div><div>&quot;curl -c cjar -b cjar -k -H &quot;Conte=
nt-Type: multipart/form-data&quot; -H &quot;X-Auth-Token: $bmc_token&quot; =
-F &#39;sa1=3D@/path/to/file1&#39; -F sa2=3D@/path/to/file2&#39; -X POST ht=
tps://$bmc/ibm/v1/files/partitions/&quot;</div><div><br></div><div>The abov=
e multipart request contains the file contents separated by a boundary and =
each file contains=C2=A0the filename, Content-Type and Content-Disposition.=
</div><div><br>There were few considerations for this and after testing tho=
se libraries, the mimetic library seemed to fit for this purpose. Please re=
fer to <a href=3D"https://github.com/LadislavSopko/mimetic" target=3D"_blan=
k">https://github.com/LadislavSopko/mimetic</a><br><br>Only a part of code =
from this library is used for this purpose (which is under &quot;mimetic&qu=
ot; folder in this repo).<br><br>Regression tests were conducted with that =
part of the library that is being used for multi-part parsing, as a part of=
 which there was no memory leakage found after firing a large number of req=
uests (2000 requests in this case).</div><div><br></div><div>There was a di=
fference of 71.68 KB in the openbmc flash size when this library is pulled.=
 The mimetic shared object files are used from mimetic/codec/.libs.<br></di=
v><div><br>If there are other suggestions for the multi-part form data pars=
ing or if there are suggestions for any other test that needs to be done, p=
lease post in the suggestions.<br><div><br></div>-- <br><div data-smartmail=
=3D"gmail_signature" dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr">Tha=
nks &amp; Regards,<div>Asmitha Karunanithi</div></div></div></div></div></d=
iv></div>

--000000000000ddcb8f059c539893--
