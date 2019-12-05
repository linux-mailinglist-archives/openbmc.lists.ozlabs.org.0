Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 484A411433D
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 16:05:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TJtb3tfzzDqZN
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 02:05:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d35;
 helo=mail-io1-xd35.google.com; envelope-from=rahulmaheshwari01@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uawx3P0f"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TJsj2n1HzDqQf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Dec 2019 02:04:41 +1100 (AEDT)
Received: by mail-io1-xd35.google.com with SMTP id c16so3917358ioh.6
 for <openbmc@lists.ozlabs.org>; Thu, 05 Dec 2019 07:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oGaADGEU5ItdyGL+No+xcbKzRmPNHhiKe7OScfw6QOQ=;
 b=Uawx3P0f/heRLSCKmNJCrpf5H4E6/dl+nKM5kVJb6BNmN7Huf5TtaWRKK51UOU+WT8
 Ow917UQm2M2Esxx/QBu4MKxZG2Oq/C+46+RE1R6yCgLYcJdgfD62oWP0+ri40Q9JcjPE
 03tQ/4nNoeMULydVsee0p46+JiVauHSztoLfaIdjp/piV+nyegfkHGRoxDv3mjZjRjzN
 2RQPXAzdZ6zPR4QnpFIDtHCSCjWahag8QBNJmPBzW9hDhV/Zs8VMQdKuibqTPW/bv4sw
 z2DT2N72mU/kW2wQNUn+9BMZaS88XFWhtyj/z9fDyKNi924Xm0+INIQUH9zQ3Hkso1TT
 1jfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oGaADGEU5ItdyGL+No+xcbKzRmPNHhiKe7OScfw6QOQ=;
 b=RqMT8PmBLKBCQabmZggqG6y0Bb+im6HgCRMzKSVce2y8+7gTbQmyabu6N1n9NL+5cA
 SBJQVtdPTmfYEzlMFvLDzxfTB7epJPLhZWiaBVoGUgR1Zo+AvnRDY6pjhDMKWcPtXY2l
 yxCCfy1HT1AMEnyhnYPFF0CaeaoZHmyg8syNWVT3lN8ymhuF5mHqBk+XPiS1iCgGeSTZ
 p3erW3uXgJ30GxPF4F6nmTI7Akz7nmpPNAZoQ8vWx8bzpo9v9b0V86ha+8NmuI8Q94HO
 iZd1Sztrg0mJlpnMJtYC+RE7pCDzZJ6ZvCHWzCvvhsTsoj1GwRI8/i/81KRvKqydBkLg
 gKzQ==
X-Gm-Message-State: APjAAAWB4HLHXXoMrz4pNWhMyrAF2DjKdGxefBEUUCJaPIExDtJfww+T
 LxHPZcEEdp5u+n9zgM6AAMdO0zzo9gOUAVso/WSVRP2e
X-Google-Smtp-Source: APXvYqw1iWI7ZKU9uJoAHMmOwlvIyr4iRHqd+ZcgIbyshSCx/MjX3VYswkN/hv8UpFGBOH6dlpwT7bv36uDalNipuq8=
X-Received: by 2002:a6b:7618:: with SMTP id g24mr6787044iom.31.1575558277140; 
 Thu, 05 Dec 2019 07:04:37 -0800 (PST)
MIME-Version: 1.0
References: <d668c41428ad4e6db20a5221f4a2306b@quantatw.com>
 <CAAMkS11DHQvaX+XHBGXDv-3j9__ZS66B1UPhpieUsnfWu+vVgQ@mail.gmail.com>
 <293a022b44784f86bee3a83fbdafd03b@quantatw.com>
In-Reply-To: <293a022b44784f86bee3a83fbdafd03b@quantatw.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Thu, 5 Dec 2019 20:35:14 +0530
Message-ID: <CAAMkS11tjgp2AH+u_s98cdXHxEkQgLxqokFc91kUNqL-SRVA0Q@mail.gmail.com>
Subject: Re: Test Case "Verify IPMI Root User Password Change" in
 openbmc-test-automation
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Content-Type: multipart/alternative; boundary="0000000000006e97830598f63fa3"
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

--0000000000006e97830598f63fa3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Your solution sound good to me. You can push the code for the same.

Thanks
Rahul

On Thu, Dec 5, 2019 at 6:01 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Tony=
.Lee@quantatw.com> wrote:

> Hi Rahul,
>
> Got it, it seems I can only skip it first.
> There is another question about test_ipmi_user.robot.
> Cases which creating a new user success, and then execute a external ipmi
> command with
> this new user account will fail on our system. For example, test case
> "Verify Setting Valid Password For IPMI User".
> The key is that the default channel in the Keyword "Set Channel Access" i=
s
> 1.
> "eth0" corresponding to channel 1 is used for debug purposes, and
> "eth1" corresponding to channel 2 is used for ipmi remote access in our
> system.
> So once I set the default channel to 2 in the Keyword "Set Channel
> Access", those cases succeed.
>
> I have a solution: add variable ${CHANNEL} default is 1 in
> lib/resource.robot.
> Then, let ${channel}=3D${CHANNEL} in Keyword "Set Channel Access".
> Let user to specify channel while running, if not, the default is 1.
>
> Example: robot -v OPENBMC_HOST:x.x.x.x -v CHANNEL:2
> ipmi/test_ipmi_user.robot
>
> Is this approach sounds fine to you or there are other suggestions?
>
> Thanks
> Tony
>
> From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
> Sent: Thursday, December 5, 2019 5:47 PM
> To: Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Tony.Lee@quantatw.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Test Case "Verify IPMI Root User Password Change" in
> openbmc-test-automation
>
> Hi Tony,
> We have also faced the same problem. So to avoid such problems, we decide=
d
> to set BMC password to 8 characters length before running our bucket. As
> far as skipping such test case, we can do that by using
> `-e Verify_IPMI_Root_User_Password_Change` while running.
>
> Example:
> robot -v OPENBMC_HOST:x.x.x.x -e Verify_IPMI_Root_User_Password_Change
> ipmi/test_ipmi_user.robot
>
> Thanks
> Rahul
>
> On Thu, Dec 5, 2019 at 8:05 AM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <ma=
ilto:
> Tony.Lee@quantatw.com> wrote:
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

--0000000000006e97830598f63fa3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Your solution sound good to me. You can push the code for =
the same.<div><br></div><div>Thanks</div><div>Rahul</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 5, 201=
9 at 6:01 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:T=
ony.Lee@quantatw.com">Tony.Lee@quantatw.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi Rahul,<br>
<br>
Got it, it seems I can only skip it first.<br>
There is another question about test_ipmi_user.robot.<br>
Cases which creating a new user success, and then execute a external ipmi c=
ommand with<br>
this new user account will fail on our system. For example, test case &quot=
;Verify Setting Valid Password For IPMI User&quot;.<br>
The key is that the default channel in the Keyword &quot;Set Channel Access=
&quot; is 1.<br>
&quot;eth0&quot; corresponding to channel 1 is used for debug purposes, and=
<br>
&quot;eth1&quot; corresponding to channel 2 is used for ipmi remote access =
in our system.<br>
So once I set the default channel to 2 in the Keyword &quot;Set Channel Acc=
ess&quot;, those cases succeed.<br>
<br>
I have a solution: add variable ${CHANNEL} default is 1 in lib/resource.rob=
ot.<br>
Then, let ${channel}=3D${CHANNEL} in Keyword &quot;Set Channel Access&quot;=
.<br>
Let user to specify channel while running, if not, the default is 1.<br>
<br>
Example: robot -v OPENBMC_HOST:x.x.x.x -v CHANNEL:2 ipmi/test_ipmi_user.rob=
ot<br>
<br>
Is this approach sounds fine to you or there are other suggestions?<br>
<br>
Thanks<br>
Tony<br>
<br>
From: Rahul Maheshwari &lt;<a href=3D"mailto:rahulmaheshwari01@gmail.com" t=
arget=3D"_blank">rahulmaheshwari01@gmail.com</a>&gt; <br>
Sent: Thursday, December 5, 2019 5:47 PM<br>
To: Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:Tony.Lee@q=
uantatw.com" target=3D"_blank">Tony.Lee@quantatw.com</a>&gt;<br>
Cc: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@l=
ists.ozlabs.org</a><br>
Subject: Re: Test Case &quot;Verify IPMI Root User Password Change&quot; in=
 openbmc-test-automation<br>
<br>
Hi Tony,<br>
We have also faced the same problem. So to avoid such problems, we decided =
to set BMC password to 8 characters length before running our bucket. As fa=
r as skipping such test case, we can do that by using `-e=C2=A0Verify_IPMI_=
Root_User_Password_Change` while running.<br>
<br>
Example:<br>
robot -v OPENBMC_HOST:x.x.x.x -e=C2=A0Verify_IPMI_Root_User_Password_Change=
 ipmi/test_ipmi_user.robot<br>
<br>
Thanks<br>
Rahul<br>
<br>
On Thu, Dec 5, 2019 at 8:05 AM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;m=
ailto:<a href=3D"mailto:Tony.Lee@quantatw.com" target=3D"_blank">Tony.Lee@q=
uantatw.com</a>&gt; wrote:<br>
Hi Rahul,<br>
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
</blockquote></div>

--0000000000006e97830598f63fa3--
