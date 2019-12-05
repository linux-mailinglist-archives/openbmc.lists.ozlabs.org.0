Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CB1113E80
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 10:48:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T9rw4hnSzDqYY
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 20:48:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134;
 helo=mail-il1-x134.google.com; envelope-from=rahulmaheshwari01@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hPxQLst8"; 
 dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47T9pG1d0hzDqZW
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 20:46:13 +1100 (AEDT)
Received: by mail-il1-x134.google.com with SMTP id f6so2398110ilh.9
 for <openbmc@lists.ozlabs.org>; Thu, 05 Dec 2019 01:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hLO9w4I8YMrDBWa+NYf5JfO8VzNn9aAMWTBMjmPasWI=;
 b=hPxQLst8Qx9sDyd8fOIxXiOOZ5GOycKxokTN7OuLQoPGh43PQHRyKWRAlh3vt9yR4c
 rZV62joVKyZnB5S+PZyOfvkS8uyXezrZsE+xxokptH/wWwERnO4LJgXfvtZ/5UwW3Hve
 qxknKllMuvy5SUiv4YjETDZ+oszvo+tn6P6yPhMsOMsQlBLQni3vXiv/Lo/LgGJiJsNa
 KCmJLfn7GNaePPa8pvDVmyiI2K/yJGzduLyb0R6gq9TC6JfzgHossTpcsWAYyzSpW10u
 bAPJnNLOa4IjQ3JahnYKXBhLPpi1+OtHVjh8K/wuZlUITOb6+187cnZafsXjR5EtBgBG
 /MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hLO9w4I8YMrDBWa+NYf5JfO8VzNn9aAMWTBMjmPasWI=;
 b=uEUPtfZMKM48ieA2o5h+PiIjm5A4lbJ0B+NPLkypMHOTLUXfpsnbBFLqPbl8FUrCmI
 YgfywCMjfeggb+GjiWGqRMI/RSKCNWhDzqTsFzJFpiBDrJg7+bQqTpZhAhwpEkNBcx5/
 PCKVD3zXbUrpkoW6UWUcPnYHDLuS/UmxU1hG7CJ/ZTqj8L7CmAWyzN5mcH+2iPVQXEd4
 AiFpxQ8bAe0HvQhW8u4dClMdEdINHTAuSWEc2sG5z6bIROyMmAa7hVqIDHN0kBEPK5Ys
 2s5Kl8Hcn+zybrdElZO+xq93qwQjvh/HFVXfFpSo5GWNjGtoBtSdIn+s2O35ksDZo11q
 f39Q==
X-Gm-Message-State: APjAAAVfpBqEPj+a6DFasjopCZvu5I+Fqis02+lQ6OoTWShQEAGNFJeO
 znYkmDjoMUv4EraGvtCShvUdCE4CCHQ4rrq8H/8nX5Iv5YM=
X-Google-Smtp-Source: APXvYqycf719OzsmF2fOW9BjTj8iA1J2e3R50N/RcypuE6clW3B9cdetTuCE/R26tEqko/CgupBdDdh+tMy17r/uoGE=
X-Received: by 2002:a92:9cc6:: with SMTP id x67mr8153358ill.31.1575539169927; 
 Thu, 05 Dec 2019 01:46:09 -0800 (PST)
MIME-Version: 1.0
References: <d668c41428ad4e6db20a5221f4a2306b@quantatw.com>
In-Reply-To: <d668c41428ad4e6db20a5221f4a2306b@quantatw.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Thu, 5 Dec 2019 15:16:45 +0530
Message-ID: <CAAMkS11DHQvaX+XHBGXDv-3j9__ZS66B1UPhpieUsnfWu+vVgQ@mail.gmail.com>
Subject: Re: Test Case "Verify IPMI Root User Password Change" in
 openbmc-test-automation
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Content-Type: multipart/alternative; boundary="0000000000008da5d20598f1cce4"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008da5d20598f1cce4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tony,
We have also faced the same problem. So to avoid such problems, we decided
to set BMC password to 8 characters length before running our bucket. As
far as skipping such test case, we can do that by using
`-e Verify_IPMI_Root_User_Password_Change` while running.

Example:
robot -v OPENBMC_HOST:x.x.x.x -e Verify_IPMI_Root_User_Password_Change
ipmi/test_ipmi_user.robot

Thanks
Rahul

On Thu, Dec 5, 2019 at 8:05 AM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Tony=
.Lee@quantatw.com> wrote:

> Hi Rahul,
>
> Reference to
> https://github.com/openbmc/openbmc-test-automation/issues/1920.
>
> Case "Verify IPMI Root User Password Change" will change root user
> password and
> unable to reset default password due to the length is limited to 8.
> As a result, cases will also fail after this because the password has bee=
n
> changed to 0penBmc1.
> Should we remove this test case? There seems to be no other way to fix it=
.
>
> Thanks
> Best Regards,
> Tony
>
>
>

--0000000000008da5d20598f1cce4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Tony,</div><div dir=3D"ltr">We have al=
so faced the same problem. So to avoid such problems, we decided to set BMC=
 password to 8 characters length before running our bucket. As far as skipp=
ing such test case, we can do that by using `-e=C2=A0Verify_IPMI_Root_User_=
Password_Change` while running.</div><div dir=3D"ltr"><br></div><div dir=3D=
"ltr">Example:<br>robot -v OPENBMC_HOST:x.x.x.x -e=C2=A0Verify_IPMI_Root_Us=
er_Password_Change ipmi/test_ipmi_user.robot<br></div><div dir=3D"ltr"><br>=
</div>Thanks<div>Rahul</div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Dec 5, 2019 at 8:05 AM Tony Lee (=E6=9D=
=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:Tony.Lee@quantatw.com">Tony.Le=
e@quantatw.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi Rahul,<br>
<br>
Reference to <a href=3D"https://github.com/openbmc/openbmc-test-automation/=
issues/1920" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbm=
c/openbmc-test-automation/issues/1920</a>.<br>
<br>
Case &quot;Verify IPMI Root User Password Change&quot; will change root use=
r password and<br>
unable to reset default password due to the length is limited to 8.<br>
As a result, cases will also fail after this because the password has been =
changed to 0penBmc1.<br>
Should we remove this test case? There seems to be no other way to fix it.<=
br>
<br>
Thanks<br>
Best Regards,<br>
Tony<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000008da5d20598f1cce4--
