Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB1C131F70
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 06:46:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sLvy39M5zDqKP
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 16:46:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::129;
 helo=mail-il1-x129.google.com; envelope-from=rahulmaheshwari01@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qOziBy47"; 
 dkim-atps=neutral
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sLv453mzzDqJH
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 16:45:16 +1100 (AEDT)
Received: by mail-il1-x129.google.com with SMTP id f10so44721816ils.8
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2020 21:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qM6Ng+cj6uHxkbzn8404yybJwBXIoSpDJf0PFDMKWYQ=;
 b=qOziBy473u7ndZVjCL4+e4SN+4h5r5bKJj7L9Rmbuiheu/wdn31CdaHsKgBTHADTGT
 vAPWlqLv5zhPOcYExCHGChaSQBcfnp3HB33L/mIs2Qgc11GWUJxsSbK4QDaqyaex4QYx
 gA9/rCYQyzrRPXjG+Cpu7WpAtJ3ecPwDkI+QuTjJZ13ih9nI0uJgIdmgJcBHVUge6AeX
 9OFTanBSBCGEQG+LrtIL2ogY0nkAmrJg50twrbIFTzJ4MYvgNXONAPczTsf7VLEN1c1N
 mdkCng6CxQ+fsCnqPcXNrHJQdD6qr+MqUlyKZJfYUdP5qTfXN7p6XJ2SdKpihS/Du8pb
 9Z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qM6Ng+cj6uHxkbzn8404yybJwBXIoSpDJf0PFDMKWYQ=;
 b=C52reeEjUX0GDo6oc/tcRKAduv2n2N19PL+yd7d9LOXNQEb+DLqANVNIZRpR32eJ2p
 bDHD0cAVDJ8/FHDSRl4NA7YXoBeKMsD0WDmt1kpakv2Z7bVM8WbvyH6oTX3Hn4i4ZV4W
 sJqg/uxB8edar+IzjBWl5EWfOWOSxlP1/qqZzN9iKT/VcSfYW3RF/mVf2ckH0IlnGveA
 Xw8qpnlbOdhsjW69WK/R2ST2DF4qrH3Lxm6rLeCGGuSUNctF6Q/NT6mfMeyQ62iw1URG
 CEP42OiG84MWlv2KToef+264TN7UM7Lg4dD+X8GwgzM3dCDB+E2lSXrIB+ToajYc/imG
 iyxg==
X-Gm-Message-State: APjAAAWdYYNukHbyIcRonk0IOd34EI7HKctFO5FTC+HIC/MOj36QpGm6
 xn7+48xMbJwNbEFcsIfwVVcNgSzhrciMnhafkCI=
X-Google-Smtp-Source: APXvYqypyDx/pvBFAZP5uCJlxUm1EJjmQOTMs/cnTG8x7MqTPB0Qh7cOAk0ofhHG4pZbAHHrZZUIzftaJuBIK8XYUQA=
X-Received: by 2002:a92:8511:: with SMTP id f17mr74814826ilh.255.1578375912939; 
 Mon, 06 Jan 2020 21:45:12 -0800 (PST)
MIME-Version: 1.0
References: <491f35b0a7fd4d10868bee1504f0c03c@quantatw.com>
In-Reply-To: <491f35b0a7fd4d10868bee1504f0c03c@quantatw.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Tue, 7 Jan 2020 11:15:21 +0530
Message-ID: <CAAMkS123QsposBjeZsi=Dtr+7ycBfDgCMgA0rH+Pnx8nG9ZhuA@mail.gmail.com>
Subject: Re: Question about IPMI password MAX length test in
 openbmc-test-automation
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Content-Type: multipart/alternative; boundary="0000000000009ce87d059b8647b7"
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
Cc: "adathatr@in.ibm.com" <adathatr@in.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009ce87d059b8647b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tony,
I would say option 2 is better. There is no need to verify IPMI command
execution when set user password is expected to fail.

Thanks
Rahul

On Mon, Jan 6, 2020 at 3:06 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Tony=
.Lee@quantatw.com> wrote:

> Hi Anusha,
>
> I met an issue that "Verify Setting IPMI User With Invalid Password
> Length" will fail when
> its user id is same as "Verify Setting IPMI User With Max Password Length=
".
>
> This is because the password length 20 has been successfully set in
> "Verify Setting IPMI User With Max Password Length".
> Therefore, the case of password_length =3D 21 and password_option =3D 20 =
is
> expected to fail but pass when their user id are the same.
>
> I have two solutions:
>
> 1. Only verify the message that cannot use invalid password length to set
> password
> and do not verify that user is able to run IPMI command with given
> username and password in this case.
>
> 2. At the end of each case, delete the user it just created to ensure tha=
t
> it will not affect other cases.
>
> Which is better, or do you have other suggestions?
>
> Thanks
> Best Regards,
> Tony
>
>

--0000000000009ce87d059b8647b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Tony,<div>I would say option 2 is better. There is no n=
eed to verify IPMI command execution when set user password is expected to =
fail.</div><div><br></div><div>Thanks</div><div>Rahul</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 6, 2=
020 at 3:06 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto=
:Tony.Lee@quantatw.com">Tony.Lee@quantatw.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi Anusha,<br>
<br>
I met an issue that &quot;Verify Setting IPMI User With Invalid Password Le=
ngth&quot; will fail when<br>
its user id is same as &quot;Verify Setting IPMI User With Max Password Len=
gth&quot;.<br>
<br>
This is because the password length 20 has been successfully set in &quot;V=
erify Setting IPMI User With Max Password Length&quot;.<br>
Therefore, the case of password_length =3D 21 and password_option =3D 20 is=
 expected to fail but pass when their user id are the same.<br>
<br>
I have two solutions:<br>
<br>
1. Only verify the message that cannot use invalid password length to set p=
assword<br>
and do not verify that user is able to run IPMI command with given username=
 and password in this case.<br>
<br>
2. At the end of each case, delete the user it just created to ensure that =
it will not affect other cases.<br>
<br>
Which is better, or do you have other suggestions?<br>
<br>
Thanks<br>
Best Regards,<br>
Tony<br>
<br>
</blockquote></div>

--0000000000009ce87d059b8647b7--
