Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 968B813A11B
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 07:44:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xgtT2d5wzDqMM
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 17:44:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=sharad.khetan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xgmg0jZKzDqN6
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 17:39:45 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 22:39:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,431,1571727600"; 
 d="scan'208,217";a="218875773"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2020 22:39:42 -0800
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 13 Jan 2020 22:39:42 -0800
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.58]) by
 fmsmsx120.amr.corp.intel.com ([169.254.15.173]) with mapi id 14.03.0439.000;
 Mon, 13 Jan 2020 22:39:41 -0800
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: MCTP over PCI on AST2500
Thread-Topic: MCTP over PCI on AST2500
Thread-Index: AQHVn2VSe/daZ1HR/0SJwnpAq7UT7qeUJeQA//96gqCAA0FRAIAtBQZQgB6Aw4CAAXo0gIAFPlBAgACtGYCAADAAwIAAj78A//9/Jmo=
Date: Tue, 14 Jan 2020 06:39:41 +0000
Message-ID: <C232EE9B-92CA-4E7E-BBC7-083D0EBC547B@intel.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <62036de3-ce3d-4ccb-ac5b-15e9ba39d22b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10C8FD@fmsmsx118.amr.corp.intel.com>
 <92f857cc-303a-0d50-e0e4-2de2a8d19e41@linux.vnet.ibm.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10E9A5@fmsmsx118.amr.corp.intel.com>,
 <22A3B800-F833-4615-B980-EE933E1F83A9@ozlabs.org>
In-Reply-To: <22A3B800-F833-4615-B980-EE933E1F83A9@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: multipart/alternative;
 boundary="_000_C232EE9B92CA4E7EBBC7083D0EBC547Bintelcom_"
MIME-Version: 1.0
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
Cc: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 rgrs <rgrs@protonmail.com>, "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_C232EE9B92CA4E7EBBC7083D0EBC547Bintelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the pointer Jeremy. We will look into demux daemon.
Thanks,
-Sharad

On Jan 13, 2020, at 10:21 PM, Jeremy Kerr <jk@ozlabs.org<mailto:jk@ozlabs.o=
rg>> wrote:

Hi Ketan,

Just a suggestion - you probably don't want to be passing MCTP messages ove=
r dbus - this is something we learnt from the IPMI implementation.

The current design of the mctp-demux-daemon (included in the libmctp codeba=
se) is intended to provide an interface that will be easy to migrate to a f=
uture kernel implementation (ie., using sockets to pass MCTP messages), and=
 allows multiple applications to be listening for MCTP messages of differen=
t types.

Regards,


Jeremy

On 14 January 2020 1:54:49 pm AWST, "Khetan, Sharad" <sharad.khetan@intel.c=
om<mailto:sharad.khetan@intel.com>> wrote:

Hi Deepak,

On 13/01/20 10:23 PM, Khetan, Sharad wrote:
Hi Andrew,

On Thu, 9 Jan 2020, at 12:27, Andrew Jeffery wrote:


 On Sat, 21 Dec 2019, at 10:45, Khetan, Sharad wrote:
 Hi Andrew,
 Sorry for late response.
 The plan is to have MCTP in user space.


 How are you handling this then? mmap()'ing the BAR from sysfs?

Sorry, let me put my brain back in, I was thinking of the wrong side of the=
  BMC/Host MCTP channel. How much were you planning to do in userspace on t=
he BMC? As in, are you planning to drive the BMC's PCIe MCTP controller fro=
m userspace (presumably via /dev/mem)?


For implementation on the BMC, we agree that it's better to do it in kernel=
 (and as you mentioned  - use consistent interface to upper layers, provide=
 another transport). However, given the time needed to implement things in =
kernel (and the review after), we are starting with a short term solution. =
We will be implementing MCTP (protocol elements) in user space, along with =
a low level MCTP PCIe driver just to push bits on PCIe. Iwona is working on=
 this and should be able to describe the exact primitive.

Do you plan to do the user-space work as an extension to/reusing components=
 from openbmc/libmctp?

Thanks,
Deepak

Yes we plan to reuse and extend the libmctp, support PCIe as well as SMBus =
bindings. We plan to use d-bus extensions to existing libmctp. That said, w=
e will know the exact extent of reuse/modifications when we really start im=
plementing.

We are implementing this for AST 2600 (will not support any workarounds for=
 AST 2500 bug).

@Andrew, Thanks for your response.

Thanks,
Sharad


--_000_C232EE9B92CA4E7EBBC7083D0EBC547Bintelcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body dir=3D"auto">
Thanks for the pointer Jeremy. We will look into demux daemon.&nbsp;<br>
Thanks,<br>
<div dir=3D"ltr" id=3D"AppleMailSignature">-Sharad</div>
<div dir=3D"ltr"><br>
On Jan 13, 2020, at 10:21 PM, Jeremy Kerr &lt;<a href=3D"mailto:jk@ozlabs.o=
rg">jk@ozlabs.org</a>&gt; wrote:<br>
<br>
</div>
<blockquote type=3D"cite">
<div dir=3D"ltr">Hi Ketan,<br>
<br>
Just a suggestion - you probably don't want to be passing MCTP messages ove=
r dbus - this is something we learnt from the IPMI implementation.<br>
<br>
The current design of the mctp-demux-daemon (included in the libmctp codeba=
se) is intended to provide an interface that will be easy to migrate to a f=
uture kernel implementation (ie., using sockets to pass MCTP messages), and=
 allows multiple applications to
 be listening for MCTP messages of different types.<br>
<br>
Regards,<br>
<br>
<br>
Jeremy<br>
<br>
<div class=3D"gmail_quote">On 14 January 2020 1:54:49 pm AWST, &quot;Khetan=
, Sharad&quot; &lt;<a href=3D"mailto:sharad.khetan@intel.com">sharad.khetan=
@intel.com</a>&gt; wrote:
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail">Hi Deepak,<br><br>On 13/01/20 10:23 PM, Khetan, Shara=
d wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex =
0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;">Hi Andrew,<br><b=
r>On Thu, 9 Jan 2020, at 12:27, Andrew Jeffery wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid=
 #ad7fa8; padding-left: 1ex;"><br><br> On Sat, 21 Dec 2019, at 10:45, Kheta=
n, Sharad wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt =
0pt 1ex 0.8ex; border-left: 1px solid #8ae234; padding-left: 1ex;"> Hi Andr=
ew,<br> Sorry for late response.<br> The plan is to have MCTP in user space=
.<br><br></blockquote><br> How are you handling this then? mmap()'ing the B=
AR from sysfs?<br></blockquote><br><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #ad7fa8; padding-left=
: 1ex;">Sorry, let me put my brain back in, I was thinking of the wrong sid=
e of the  BMC/Host MCTP channel. How much were you planning to do in usersp=
ace on the BMC? As in, are you planning to drive the BMC's PCIe MCTP contro=
ller from userspace (presumably via /dev/mem)?<br></blockquote><br>  <br>Fo=
r implementation on the BMC, we agree that it's better to do it in kernel (=
and as you mentioned  - use consistent interface to upper layers, provide a=
nother transport). However, given the time needed to implement things in ke=
rnel (and the review after), we are starting with a short term solution. We=
 will be implementing MCTP (protocol elements) in user space, along with a =
low level MCTP PCIe driver just to push bits on PCIe. Iwona is working on t=
his and should be able to describe the exact primitive.<br></blockquote><br=
>Do you plan to do the user-space work as an extension to/reusing component=
s from openbmc/libmctp?<br><br>Thanks,<br>Deepak<br><br>Yes we plan to reus=
e and extend the libmctp, support PCIe as well as SMBus bindings. We plan t=
o use d-bus extensions to existing libmctp. That said, we will know the exa=
ct extent of reuse/modifications when we really start implementing.<br><br>=
We are implementing this for AST 2600 (will not support any workarounds for=
 AST 2500 bug). <br><br>@Andrew, Thanks for your response.<br><br>Thanks,<b=
r>Sharad<br> <br></pre>
</blockquote>
</div>
</div>
</blockquote>
</body>
</html>

--_000_C232EE9B92CA4E7EBBC7083D0EBC547Bintelcom_--
