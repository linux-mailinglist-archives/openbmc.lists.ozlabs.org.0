Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F914B265
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 11:16:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486Mw90SZSzDqJm
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 21:16:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d;
 helo=mail-wm1-x32d.google.com; envelope-from=asmithakarun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L1QSqrHm; dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486Mv46v5vzDqFt
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 21:15:25 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id q9so1828192wmj.5
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 02:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N4SRWp4OVj9hg+qC2jLncILKOEsyWL1RkPwSEMHnsY4=;
 b=L1QSqrHm1pAfq1EGB4qZgoX0nSdbYX5wW8NDdgY0c2L2OZ8W3wf4l/bkRsMNo5jPl5
 h7s+OW+d/+oVX3dOj5+CkDbN4QiLDwM1LEANp/eMxQZ+1Q88XHlPMpHw3KROYLt2K0F6
 rw3JMiuuMMJUF1Se8qnjLq0wEqVovNy+rEGK8T2I8uviDllklRlWfl+RX2sg4kZWtuCR
 gFAX1XXToQC34ao/4lOlwZ9pfOZyCNwB5sLwGlbxVTv33t19qYBg1vDPfnczvRWL5y3I
 KLCJL5JeWfUDeNXywBDoOmZMUNyhltmk1qU6hqhLzNhKwn/rycDkYXv1EuatKCiY412g
 mkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N4SRWp4OVj9hg+qC2jLncILKOEsyWL1RkPwSEMHnsY4=;
 b=A2r//C51T0MROia2qi+ajMg7Qtu+XmZt01uU6LURXt1sY5WhJ+s1SBh1ynrZH56vI8
 v1yT1gMONSaiusftbGEg0vbV61QGnGyX2hBpYK9Nqyvavq3nUOsWJN8pS0X0JdrqfIfh
 aU8dPAPPpcA4yMQ+qfzw2YmYD1K+aO/vS/49/4R6CB+V0vS7SPrvZB+t3YJbwxMJ8e0L
 +q5HJoj983g+Ud0UNNuuDNUat0lZIrLRFiE/qQYehPMer5BCuBKHjebyUuj9neZRV4hF
 mnQkGqpRR5dvqtAHj3LY2uvm7HsVNQzJKpoqXxvjWtWr97Ga6AOPOxvj1Abin+lG0bP8
 W3HQ==
X-Gm-Message-State: APjAAAWRl4V3Wje4/5l5cWxUhvnLijgWmx0s5WmT6DuOMWTdkPRuFFV3
 +rM2ur5JbL/+/9e5AStpCfb4/b6WwXZQOJmySUE=
X-Google-Smtp-Source: APXvYqwp0jkWLaoutyoCR7BXd+Y7Uj6QDKMOjdOlVwdvA4j3sUCKbaxhNUXqOz4Py9amWXWl5oZe1nCGG7JXAKzJ5XM=
X-Received: by 2002:a1c:451:: with SMTP id 78mr3939284wme.125.1580206521043;
 Tue, 28 Jan 2020 02:15:21 -0800 (PST)
MIME-Version: 1.0
References: <CANGK-S4vcQ9P_fW6ev9h83=GRLCEDr9KeFH2gt-soQ9JpaY_Kw@mail.gmail.com>
In-Reply-To: <CANGK-S4vcQ9P_fW6ev9h83=GRLCEDr9KeFH2gt-soQ9JpaY_Kw@mail.gmail.com>
From: Asmitha Karunanithi <asmithakarun@gmail.com>
Date: Tue, 28 Jan 2020 15:44:44 +0530
Message-ID: <CANGK-S4cpq51ya7QFv1jip=nZOOiDhqc+8PAJX7oOo3T0pN2Pw@mail.gmail.com>
Subject: Re: Library to aid multi-part form data parsing
To: mine260309@gmail.com, bradleyb@fuzziesquirrel.com
Content-Type: multipart/alternative; boundary="0000000000005bce86059d308044"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000005bce86059d308044
Content-Type: text/plain; charset="UTF-8"

Hi Brad and Lei,

Are there any concerns about having libmimetic for multi-part parsing.
Please have a look at the below mail.

If there are any other suggestions, please post in here.

On Fri, Jan 17, 2020 at 4:11 PM Asmitha Karunanithi <asmithakarun@gmail.com>
wrote:

> Hi All,
>
> There was a requirement to parse multipart form data during file upload
> for the vendor-specific interface.
>
> The Curl command for multiple file upload will be:
>
> "curl -c cjar -b cjar -k -H "Content-Type: multipart/form-data" -H
> "X-Auth-Token: $bmc_token" -F 'sa1=@/path/to/file1' -F sa2=@/path/to/file2'
> -X POST https://$bmc/ibm/v1/files/partitions/"
>
> The above multipart request contains the file contents separated by a
> boundary and each file contains the filename, Content-Type and
> Content-Disposition.
>
> There were few considerations for this and after testing those libraries,
> the mimetic library seemed to fit for this purpose. Please refer to
> https://github.com/LadislavSopko/mimetic
>
> Only a part of code from this library is used for this purpose (which is
> under "mimetic" folder in this repo).
>
> Regression tests were conducted with that part of the library that is
> being used for multi-part parsing, as a part of which there was no memory
> leakage found after firing a large number of requests (2000 requests in
> this case).
>
> There was a difference of 71.68 KB in the openbmc flash size when this
> library is pulled. The mimetic shared object files are used from
> mimetic/codec/.libs.
>
> If there are other suggestions for the multi-part form data parsing or if
> there are suggestions for any other test that needs to be done, please post
> in the suggestions.
>
> --
> Thanks & Regards,
> Asmitha Karunanithi
>


-- 
Thanks & Regards,
Asmitha Karunanithi

--0000000000005bce86059d308044
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Brad and Lei,</div><div><br></div><div>Are there a=
ny concerns about having libmimetic for multi-part parsing. Please have a l=
ook at the below mail.</div><div><br></div><div>If there are any other sugg=
estions, please post in here.</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jan 17, 2020 at 4:11 PM Asmitha Karun=
anithi &lt;<a href=3D"mailto:asmithakarun@gmail.com" target=3D"_blank">asmi=
thakarun@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr">Hi All,<div><br></div><div>There was a r=
equirement to parse multipart form data during file upload for the vendor-s=
pecific interface.<br></div><div><br></div><div>The Curl command for multip=
le file upload will be:</div><div><br></div><div>&quot;curl -c cjar -b cjar=
 -k -H &quot;Content-Type: multipart/form-data&quot; -H &quot;X-Auth-Token:=
 $bmc_token&quot; -F &#39;sa1=3D@/path/to/file1&#39; -F sa2=3D@/path/to/fil=
e2&#39; -X POST https://$bmc/ibm/v1/files/partitions/&quot;</div><div><br><=
/div><div>The above multipart request contains the file contents separated =
by a boundary and each file contains=C2=A0the filename, Content-Type and Co=
ntent-Disposition.</div><div><br>There were few considerations for this and=
 after testing those libraries, the mimetic library seemed to fit for this =
purpose. Please refer to <a href=3D"https://github.com/LadislavSopko/mimeti=
c" target=3D"_blank">https://github.com/LadislavSopko/mimetic</a><br><br>On=
ly a part of code from this library is used for this purpose (which is unde=
r &quot;mimetic&quot; folder in this repo).<br><br>Regression tests were co=
nducted with that part of the library that is being used for multi-part par=
sing, as a part of which there was no memory leakage found after firing a l=
arge number of requests (2000 requests in this case).</div><div><br></div><=
div>There was a difference of 71.68 KB in the openbmc flash size when this =
library is pulled. The mimetic shared object files are used from mimetic/co=
dec/.libs.<br></div><div><br>If there are other suggestions for the multi-p=
art form data parsing or if there are suggestions for any other test that n=
eeds to be done, please post in the suggestions.<br><div><br></div>-- <br><=
div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr">Thanks &amp; Regards=
,<div>Asmitha Karunanithi</div></div></div></div></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr">Thanks &amp; Regards,<div>Asmitha K=
arunanithi</div></div></div></div></div></div>

--0000000000005bce86059d308044--
