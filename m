Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF45213A0EB
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 07:21:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xgMg0sKpzDqPK
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 17:21:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xgM00GTzzDqM0
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 17:21:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=bli3JP+C; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47xgLx3p75z9sP6;
 Tue, 14 Jan 2020 17:20:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1578982859; bh=kUIQQn6Ur4iYGW2ulvNfz+e+j7atGK4XZYz1iAETC+Q=;
 h=Date:In-Reply-To:References:Subject:To:CC:From:From;
 b=bli3JP+CA4x97kRPm6y6mBcans5r/tM6HuTcHACKt09DrnqncpbawN0JlgdfCZpPW
 6w4JLOlKAE2o60YIPl51c7HxGmyV/snvvFZ28WSHgEeYJizJDiB0yR09AZJSdIju3Q
 vnJ08osFZBh5tTJ4PMBOkCD40UPY+vP/dqIwAwVIQkcoepiQ6HVU7/rb1HG0OHnoK1
 XB0DRb77YD9av9UKxnFb4HDuqVCr/6Cze7ziNuJf19IngLoOSN/gkwxwS1v1Q4oVFc
 QXwabaro+DRxDwyQZ0J2wpGJlsHc+EuWwsTUen5zYr8R2rNFzbqSak8Q+Feoycwrd7
 a8A+E/9TPyBwg==
Date: Tue, 14 Jan 2020 14:20:52 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <865C376D1B77624AAA570EFEF73CE52F9E10E9A5@fmsmsx118.amr.corp.intel.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <62036de3-ce3d-4ccb-ac5b-15e9ba39d22b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10C8FD@fmsmsx118.amr.corp.intel.com>
 <92f857cc-303a-0d50-e0e4-2de2a8d19e41@linux.vnet.ibm.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10E9A5@fmsmsx118.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----IK80XE5L5AOKG067HN4VVBIKR6HM4D"
Content-Transfer-Encoding: 7bit
Subject: RE: MCTP over PCI on AST2500
To: "Khetan, Sharad" <sharad.khetan@intel.com>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>, Vijay Khemka <vijaykhemka@fb.com>,
 rgrs <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <22A3B800-F833-4615-B980-EE933E1F83A9@ozlabs.org>
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
Cc: "Bhat, Sumanth" <sumanth.bhat@intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------IK80XE5L5AOKG067HN4VVBIKR6HM4D
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ketan,

Just a suggestion - you probably don't want to be passing MCTP messages ov=
er dbus - this is something we learnt from the IPMI implementation=2E

The current design of the mctp-demux-daemon (included in the libmctp codeb=
ase) is intended to provide an interface that will be easy to migrate to a =
future kernel implementation (ie=2E, using sockets to pass MCTP messages), =
and allows multiple applications to be listening for MCTP messages of diffe=
rent types=2E

Regards,


Jeremy

On 14 January 2020 1:54:49 pm AWST, "Khetan, Sharad" <sharad=2Ekhetan@inte=
l=2Ecom> wrote:
>Hi Deepak,
>
>On 13/01/20 10:23 PM, Khetan, Sharad wrote:
>> Hi Andrew,
>>=20
>> On Thu, 9 Jan 2020, at 12:27, Andrew Jeffery wrote:
>>>
>>>
>>> On Sat, 21 Dec 2019, at 10:45, Khetan, Sharad wrote:
>>>> Hi Andrew,
>>>> Sorry for late response=2E
>>>> The plan is to have MCTP in user space=2E
>>>>
>>>
>>> How are you handling this then? mmap()'ing the BAR from sysfs?
>>=20
>>> Sorry, let me put my brain back in, I was thinking of the wrong side
>of the  BMC/Host MCTP channel=2E How much were you planning to do in
>userspace on the BMC? As in, are you planning to drive the BMC's PCIe
>MCTP controller from userspace (presumably via /dev/mem)?
>>=20
>>  =20
>> For implementation on the BMC, we agree that it's better to do it in
>kernel (and as you mentioned  - use consistent interface to upper
>layers, provide another transport)=2E However, given the time needed to
>implement things in kernel (and the review after), we are starting with
>a short term solution=2E We will be implementing MCTP (protocol elements)
>in user space, along with a low level MCTP PCIe driver just to push
>bits on PCIe=2E Iwona is working on this and should be able to describe
>the exact primitive=2E
>
>Do you plan to do the user-space work as an extension to/reusing
>components from openbmc/libmctp?
>
>Thanks,
>Deepak
>
>Yes we plan to reuse and extend the libmctp, support PCIe as well as
>SMBus bindings=2E We plan to use d-bus extensions to existing libmctp=2E
>That said, we will know the exact extent of reuse/modifications when we
>really start implementing=2E
>
>We are implementing this for AST 2600 (will not support any workarounds
>for AST 2500 bug)=2E=20
>
>@Andrew, Thanks for your response=2E
>
>Thanks,
>Sharad
>=20

------IK80XE5L5AOKG067HN4VVBIKR6HM4D
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Hi Ketan,<br><br>Just a suggestion - you probably =
don't want to be passing MCTP messages over dbus - this is something we lea=
rnt from the IPMI implementation=2E<br><br>The current design of the mctp-d=
emux-daemon (included in the libmctp codebase) is intended to provide an in=
terface that will be easy to migrate to a future kernel implementation (ie=
=2E, using sockets to pass MCTP messages), and allows multiple applications=
 to be listening for MCTP messages of different types=2E<br><br>Regards,<br=
><br><br>Jeremy<br><br><div class=3D"gmail_quote">On 14 January 2020 1:54:4=
9 pm AWST, "Khetan, Sharad" &lt;sharad=2Ekhetan@intel=2Ecom&gt; wrote:<bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-l=
eft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail">Hi Deepak,<br><br>On 13/01/20 10:23 PM, Khetan, Shar=
ad wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex=
 0=2E8ex; border-left: 1px solid #729fcf; padding-left: 1ex;">Hi Andrew,<br=
><br>On Thu, 9 Jan 2020, at 12:27, Andrew Jeffery wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px s=
olid #ad7fa8; padding-left: 1ex;"><br><br> On Sat, 21 Dec 2019, at 10:45, K=
hetan, Sharad wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin: =
0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #8ae234; padding-left: 1ex;"> H=
i Andrew,<br> Sorry for late response=2E<br> The plan is to have MCTP in us=
er space=2E<br><br></blockquote><br> How are you handling this then? mmap()=
'ing the BAR from sysfs?<br></blockquote><br><blockquote class=3D"gmail_quo=
te" style=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #ad7fa8; p=
adding-left: 1ex;">Sorry, let me put my brain back in, I was thinking of th=
e wrong side of the  BMC/Host MCTP channel=2E How much were you planning to=
 do in userspace on the BMC? As in, are you planning to drive the BMC's PCI=
e MCTP controller from userspace (presumably via /dev/mem)?<br></blockquote=
><br>  <br>For implementation on the BMC, we agree that it's better to do i=
t in kernel (and as you mentioned  - use consistent interface to upper laye=
rs, provide another transport)=2E However, given the time needed to impleme=
nt things in kernel (and the review after), we are starting with a short te=
rm solution=2E We will be implementing MCTP (protocol elements) in user spa=
ce, along with a low level MCTP PCIe driver just to push bits on PCIe=2E Iw=
ona is working on this and should be able to describe the exact primitive=
=2E<br></blockquote><br>Do you plan to do the user-space work as an extensi=
on to/reusing components from openbmc/libmctp?<br><br>Thanks,<br>Deepak<br>=
<br>Yes we plan to reuse and extend the libmctp, support PCIe as well as SM=
Bus bindings=2E We plan to use d-bus extensions to existing libmctp=2E That=
 said, we will know the exact extent of reuse/modifications when we really =
start implementing=2E<br><br>We are implementing this for AST 2600 (will no=
t support any workarounds for AST 2500 bug)=2E <br><br>@Andrew, Thanks for =
your response=2E<br><br>Thanks,<br>Sharad<br> <br></pre></blockquote></div>=
</body></html>
------IK80XE5L5AOKG067HN4VVBIKR6HM4D--
