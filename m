Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A72BFE20
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 03:17:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CfW4r6FfvzDqP4
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 13:17:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-na.com (client-ip=40.107.236.48;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=mohaimen.alsamarai@fii-na.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fii-na.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=B+VvDIPR; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cd2gm4BTpzDqlY
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2020 03:53:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mbse77OmpGyIZfaD4paJWQ5epd+jBabh4yINYyTNKgE8XOnMfyO4EDVMNyujEBMDTxJqqd8YLX9XA/G/vFlWYaQpQ5mBNWYaCemP2hvLNyPZPlwE95S8TF/L/QCp4FiziVWlb5+touQaDT5HtmzOnSrbQU7hDpk68Iz5uww9Wpi5MxwXHIOwkUmqFmGlucq36KkG1n08EoaiFLmxH3GN7tyJxgCasc+5xA9fOa0kw3w4tKhWNiukpnuD/Vr498ULaVfFEmQLq7SkxYE2vAuYJNvsqpnN48GEJTMeF2VHZ5Hw7hu77l34mRZeMlZlUi13bAo1MDCVF52/u383TNj6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lLJbvtpoxEDj424hSVol7nhsDu86N0tMQd0CXNLOGM=;
 b=H2mJO+j73HCc6im4W8MV35uM1xSFCfRuvaxEw2b+HnhJZ5rH2E7Bc7zisdX/85oYtnlLcp8GwtYbJbRbkS8KbvM1eqpQwA/R+WqfwPxFlUn/MXf2+/3Y49EcR2UUd+5oBRXQwnZqysC/dS+8kfKI6D825mFevrnjOIBnv6/MBYYA6HSOfS+QhkHVUJNFnwG41MeBk7pTVofKhIqKgpCx+SDUjc34dhTsSLzNLtOG7SPkXLwR/rMbui9AfMFI3dyH7bsd6IHYNT9Yc+pGFhHJiIobC/i0kqXNGRA1xj719pAzkgaMAFjbNMX7D+QEtu7SPlsVLZ/KDh0XfBl7JIVi8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lLJbvtpoxEDj424hSVol7nhsDu86N0tMQd0CXNLOGM=;
 b=B+VvDIPRZxTFZtPLTGlQbJfaBgsNUOZiScX9CVDsgZeeLHqPRv+nU7fbkX5hMXRtYIFXjtuiLxMPrMH0QNwuBbMOhMRekOR7y4abhUTHi9fMgvwHcTm0pfa6iW+8Bhyj7tvQ5808RtxRLjkWDpxiroT16eiM1SLNiXEoV/WOWo/eRCNg+rxWN1o2nDFY74fWcdpe1RX0wRaz0xudkj9PkKB9Bfr/nUTbTVfQtTWuh1FgZV1BfaKsfJkPnPNx7swSrMMDWXP4RL4pR/seZ/ocReNseKZqeQ7UKPY6tw5V1NKbAAtDB4elaBTra/HBkxSDqOS84sZ/5jeCKnxDVzPZbg==
Received: from DM6PR08MB5883.namprd08.prod.outlook.com (2603:10b6:5:152::18)
 by DM6PR08MB3980.namprd08.prod.outlook.com (2603:10b6:5:8f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Fri, 20 Nov
 2020 16:53:45 +0000
Received: from DM6PR08MB5883.namprd08.prod.outlook.com
 ([fe80::b0ec:23cd:3a5:4cb3]) by DM6PR08MB5883.namprd08.prod.outlook.com
 ([fe80::b0ec:23cd:3a5:4cb3%7]) with mapi id 15.20.3589.022; Fri, 20 Nov 2020
 16:53:44 +0000
From: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
To: William Kennington <wak@google.com>
Subject: Re: phosphor-ipmi-flash build error
Thread-Topic: phosphor-ipmi-flash build error
Thread-Index: Ada9JfK8weeOoKkOTu2JHZHbpAKwRwB2/ZQAABZ4CH8=
Date: Fri, 20 Nov 2020 16:53:44 +0000
Message-ID: <DM6PR08MB5883F020F59F625762BCE1EAB2FF0@DM6PR08MB5883.namprd08.prod.outlook.com>
References: <DM6PR08MB588362D381EC3603682F9B32B2E20@DM6PR08MB5883.namprd08.prod.outlook.com>,
 <CAPnigKmZ1FHWXjbhG_XnrgmsYPpjXQhTLwM0cW=6Mf00iQatXQ@mail.gmail.com>
In-Reply-To: <CAPnigKmZ1FHWXjbhG_XnrgmsYPpjXQhTLwM0cW=6Mf00iQatXQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=fii-na.com;
x-originating-ip: [98.201.115.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2dfd3fdd-3a4d-4acc-a5e0-08d88d74d7ca
x-ms-traffictypediagnostic: DM6PR08MB3980:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR08MB398092874C80CB8D04E9D8D2B2FF0@DM6PR08MB3980.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 47xr9ZXoPQR4dJF3vUP3R61nqOgdEiXC7n1kVlWCh3ezVk/c7t0L55EEmiImt34SFHB6gbHZHFS/mqayuTaeFitaSgcw07b21VU5N+N410njPLktcuil8al/1UIbzskrbP2gZ4LBAp33/QjRbYQgakjdkgcmP9RrQU3q9SaupFbpAsxtDg2JDxo+ZFXBdGq2g+LZ5c1Ih86eeHB5xPmXp0lrkKoaZpIoU4+oiY5oBPxzdU1IL49YhG6oBwYBTfX2sE7BXkzKS38cD6MkzqfFXeFoPz07CEJ2SodQAEwj1n2hDkKIEOEEDS3caa6CYea6t9B9NnPnpEdPlSBfZNjL6ffbY/q3YysaheRKkbEli9wVPJ/P+7zSxdSGetojK5FmYTQiOqV4+UsCK1evRngpVQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR08MB5883.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(136003)(396003)(376002)(366004)(5660300002)(66556008)(9686003)(6916009)(64756008)(26005)(53546011)(71200400001)(6506007)(316002)(7696005)(8676002)(52536014)(478600001)(966005)(54906003)(66476007)(55016002)(186003)(66446008)(3480700007)(19627405001)(8936002)(33656002)(86362001)(66946007)(2906002)(76116006)(4326008)(166002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Nb2AMzF8fGZVpeVynnBC4f4YcUbwqETbuQy9hUnMu7MI0kZAMRxecLp/pVwipsw6lXDJ3lzILfQ3zQFM/m/pNdaLLxHWoD7UV0O8lhVnxOyaGLvY8W9bfjyq+c6yPayNDKCzJzQA57eIejdhmKdVb6M7kDOrn2i5yuNsqO/6P+kXQ/+TEyTADNWibXc/0f4bE9fj9lqx51g9st2qQHRBFcLwpuMkMQd5nQpBxJPceMCsufQJbpETLg2paX99P3ZK58mW1G4BTA1p/jbzuN555qJii7I6dbjgTMeq3qHgV4/8CXZyWn4WKvFs9VoYTiPkMhO9klQVowlJirc1MVaEWwyn08Ra40wS2edib4H5+VSp+Sk0VH8z+i1FKanAlvITsjdFqLYj8fA7pCXe9kbfse+NlqerzbLx0Doca1ZusmVnjFgjvdN45MsRVbbwIjRoK77ySGQZkeBIYK7QmGHuPUzsYDCVAx+O2Lf8ZV6o9aUk6zXxkA1WMqgtADzWZL36LMAkMaVzSIxXj1xRGyPmAydhJy++cCg/WB5U6322NAga8j8QFkg+v5qvSu+kYLns00FbvcSyKlb/p2YlOX/6i7Il29CUywd8NqJqhUNCJUs8OxUeU+zWmh7Q7xKF1eBiCssGddYeHvmQQZTrX9To5A==
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB5883F020F59F625762BCE1EAB2FF0DM6PR08MB5883namp_"
MIME-Version: 1.0
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB5883.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfd3fdd-3a4d-4acc-a5e0-08d88d74d7ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 16:53:44.6971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7De+XOtxpTXIU43Nvm7KS4Wzzf0hqNLU/gMUmanZ0jr9PUiCcUUih7+Cshx7pjc4/tY2O/qWSkeesQxDGAHi0+vkoKgsAVvYcKQ+vciaMN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB3980
X-Mailman-Approved-At: Mon, 23 Nov 2020 13:15:07 +1100
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
Cc: Lancelot Kao <lancelot.cy.kao@fii-na.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 XP Chen <Xiao-Peng.Chen@fii-na.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM6PR08MB5883F020F59F625762BCE1EAB2FF0DM6PR08MB5883namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi William,
we were able to build successfully on x86-64 (ubuntu) but fails in aarch64 =
(centOS8) see log below


[root@localhost phosphor-ipmi-flash]# make
make  all-recursive
make[1]: Entering directory '/root/phosphor-ipmi-flash'
Making all in .
make[2]: Entering directory '/root/phosphor-ipmi-flash'
make[2]: Leaving directory '/root/phosphor-ipmi-flash'
Making all in tools
make[2]: Entering directory '/root/phosphor-ipmi-flash/tools'
Making all in .
make[3]: Entering directory '/root/phosphor-ipmi-flash/tools'
  CXXLDburn_my_bmc
burn_my_bmc-main.o: In function `main':
main.cpp:(.text+0x7e0): undefined reference to `internal::sys_impl'
main.cpp:(.text+0x7e4): undefined reference to `internal::sys_impl'
burn_my_bmc-main.o: In function `std::_MakeUniq<host_tool::BtDataHandler>::=
__single_object std::make_unique<host_tool::BtDataHandler, ipmiblob::BlobHa=
ndler*, ho   st_tool::ProgressStdoutIndicator*>(ipmiblob::BlobHandler*&&, h=
ost_tool::ProgressStdoutIndicator*&&)':
main.cpp:(.text._ZSt11make_uniqueIN9host_tool13BtDataHandlerEJPN8ipmiblob11=
BlobHandlerEPNS0_23ProgressStdoutIndicatorEEENSt9_MakeUniqIT_E15__single_ob=
jectEDpOT0_[_ZSt11make_uniqueIN9host_tool13BtDataHandlerEJPN8ipmiblob11Blob=
HandlerEPNS0_23ProgressStdoutIndicatorEEENSt9_MakeUniqIT_E15__single_object=
EDpOT0_]+0x40): undefined reference to `internal::sys_impl'
main.cpp:(.text._ZSt11make_uniqueIN9host_tool13BtDataHandlerEJPN8ipmiblob11=
BlobHandlerEPNS0_23ProgressStdoutIndicatorEEENSt9_MakeUniqIT_E15__single_ob=
jectEDpOT0_[_ZSt11make_uniqueIN9host_tool13BtDataHandlerEJPN8ipmiblob11Blob=
HandlerEPNS0_23ProgressStdoutIndicatorEEENSt9_MakeUniqIT_E15__single_object=
EDpOT0_]+0x44): undefined reference to `internal::sys_impl'
burn_my_bmc-main.o: In function `std::_MakeUniq<host_tool::NetDataHandler>:=
:__single_object std::make_unique<host_tool::NetDataHandler, ipmiblob::Blob=
Handler*,host_tool::ProgressStdoutIndicator*, std::__cxx11::basic_string<ch=
ar, std::char_traits<char>, std::allocator<char> >&, std::__cxx11::basic_st=
ring<char, std::char_traits<char>, std::allocator<char> >&>(ipmiblob::BlobH=
andler*&&, host_tool::ProgressStdoutIndicator*&&, std::__cxx11::basic_strin=
g<char, std::char_traits<char>, std::allocator<char> >&, std::__cxx11::basi=
c_string<char, std::char_traits<char>, std::allocator<char> >&)':
main.cpp:(.text._ZSt11make_uniqueIN9host_tool14NetDataHandlerEJPN8ipmiblob1=
1BlobHandlerEPNS0_23ProgressStdoutIndicatorERNSt7__cxx1112basic_stringIcSt1=
1char_traitsIcESaIcEEESD_EENSt9_MakeUniqIT_E15__single_objectEDpOT0_[_ZSt11=
make_uniqueIN9host_tool14NetDataHandlerEJPN8ipmiblob11BlobHandlerEPNS0_23Pr=
ogressStdoutIndicatorERNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE=
SD_EENSt9_MakeUniqIT_E15__single_objectEDpOT0_]+0x64): undefined reference =
to `internal::sys_impl'
burn_my_bmc-main.o:main.cpp:(.text._ZSt11make_uniqueIN9host_tool14NetDataHa=
ndlerEJPN8ipmiblob11BlobHandlerEPNS0_23ProgressStdoutIndicatorERNSt7__cxx11=
12basic_stringIcSt11char_traitsIcESaIcEEESD_EENSt9_MakeUniqIT_E15__single_o=
bjectEDpOT0_[_ZSt11make_uniqueIN9host_tool14NetDataHandlerEJPN8ipmiblob11Bl=
obHandlerEPNS0_23ProgressStdoutIndicatorERNSt7__cxx1112basic_stringIcSt11ch=
ar_traitsIcESaIcEEESD_EENSt9_MakeUniqIT_E15__single_objectEDpOT0_]+0x68): m=
ore undefined references to `internal::sys_impl' follow
collect2: error: ld returned 1 exit status
make[3]: *** [Makefile:570: burn_my_bmc] Error 1
make[3]: Leaving directory '/root/phosphor-ipmi-flash/tools'
make[2]: *** [Makefile:725: all-recursive] Error 1
make[2]: Leaving directory '/root/phosphor-ipmi-flash/tools'
make[1]: *** [Makefile:615: all-recursive] Error 1
make[1]: Leaving directory '/root/phosphor-ipmi-flash'
make: *** [Makefile:475: all] Error 2
[root@localhost phosphor-ipmi-flash]#



Thanks,
Mohaimen Alsamarai

________________________________
From: William Kennington <wak@google.com>
Sent: Thursday, November 19, 2020 11:56 PM
To: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; XP Chen <Xiao-Peng=
.Chen@fii-na.com>; Lancelot Kao <lancelot.cy.kao@fii-na.com>; Benjamin Fair=
 <benjaminfair@google.com>
Subject: Re: phosphor-ipmi-flash build error

If you are installing these manually, be sure to install https://github.com=
/martinmoene/span-lite before building and installing stdplus and phosphor-=
ipmi-flash.

--_000_DM6PR08MB5883F020F59F625762BCE1EAB2FF0DM6PR08MB5883namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi William,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"box-sizing:border-box;font-family:&quot;Segoe UI&quot;, syste=
m-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-serif=
;font-size:14px">
we were able to build successfully on x86-64 (ubuntu) but fails in aarch64 =
(centOS8) see log below&nbsp;</div>
<div style=3D"box-sizing:border-box;font-family:&quot;Segoe UI&quot;, syste=
m-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-serif=
;font-size:14px">
<br>
</div>
<div style=3D"box-sizing:border-box;font-family:&quot;Segoe UI&quot;, syste=
m-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-serif=
;font-size:14px">
<br>
</div>
<div style=3D"box-sizing:border-box;font-family:&quot;Segoe UI&quot;, syste=
m-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-serif=
;font-size:14px">
[root@localhost phosphor-ipmi-flash]# make
<div>make &nbsp;all-recursive</div>
<div>make[1]: Entering directory '/root/phosphor-ipmi-flash'</div>
<div>Making all in .</div>
<div>make[2]: Entering directory '/root/phosphor-ipmi-flash'</div>
<div>make[2]: Leaving directory '/root/phosphor-ipmi-flash'</div>
<div>Making all in tools</div>
<div>make[2]: Entering directory '/root/phosphor-ipmi-flash/tools'</div>
<div>Making all in .</div>
<div>make[3]: Entering directory '/root/phosphor-ipmi-flash/tools'</div>
<div>&nbsp; CXXLDburn_my_bmc</div>
<div>burn_my_bmc-main.o: In function `main':</div>
<div>main.cpp:(.text+0x7e0): undefined reference to `internal::sys_impl'</d=
iv>
<div>main.cpp:(.text+0x7e4): undefined reference to `internal::sys_impl'</d=
iv>
<div>burn_my_bmc-main.o: In function `std::_MakeUniq&lt;host_tool::BtDataHa=
ndler&gt;::__single_object std::make_unique&lt;host_tool::BtDataHandler, ip=
miblob::BlobHandler*, ho &nbsp; st_tool::ProgressStdoutIndicator*&gt;(ipmib=
lob::BlobHandler*&amp;&amp;, host_tool::ProgressStdoutIndicator*&amp;&amp;)=
':</div>
<div>main.cpp:(.text._ZSt11make_uniqueIN9host_tool13BtDataHandlerEJPN8ipmib=
lob11BlobHandlerEPNS0_23ProgressStdoutIndicatorEEENSt9_MakeUniqIT_E15__sing=
le_objectEDpOT0_[_ZSt11make_uniqueIN9host_tool13BtDataHandlerEJPN8ipmiblob1=
1BlobHandlerEPNS0_23ProgressStdoutIndicatorEEENSt9_MakeUniqIT_E15__single_o=
bjectEDpOT0_]+0x40):
 undefined reference to `internal::sys_impl'</div>
<div>main.cpp:(.text._ZSt11make_uniqueIN9host_tool13BtDataHandlerEJPN8ipmib=
lob11BlobHandlerEPNS0_23ProgressStdoutIndicatorEEENSt9_MakeUniqIT_E15__sing=
le_objectEDpOT0_[_ZSt11make_uniqueIN9host_tool13BtDataHandlerEJPN8ipmiblob1=
1BlobHandlerEPNS0_23ProgressStdoutIndicatorEEENSt9_MakeUniqIT_E15__single_o=
bjectEDpOT0_]+0x44):
 undefined reference to `internal::sys_impl'</div>
<div>burn_my_bmc-main.o: In function `std::_MakeUniq&lt;host_tool::NetDataH=
andler&gt;::__single_object std::make_unique&lt;host_tool::NetDataHandler, =
ipmiblob::BlobHandler*,host_tool::ProgressStdoutIndicator*, std::__cxx11::b=
asic_string&lt;char, std::char_traits&lt;char&gt;,
 std::allocator&lt;char&gt; &gt;&amp;, std::__cxx11::basic_string&lt;char, =
std::char_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt;&amp;&gt;(ipmi=
blob::BlobHandler*&amp;&amp;, host_tool::ProgressStdoutIndicator*&amp;&amp;=
, std::__cxx11::basic_string&lt;char, std::char_traits&lt;char&gt;, std::al=
locator&lt;char&gt; &gt;&amp;, std::__cxx11::basic_string&lt;char,
 std::char_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt;&amp;)':</div=
>
<div>main.cpp:(.text._ZSt11make_uniqueIN9host_tool14NetDataHandlerEJPN8ipmi=
blob11BlobHandlerEPNS0_23ProgressStdoutIndicatorERNSt7__cxx1112basic_string=
IcSt11char_traitsIcESaIcEEESD_EENSt9_MakeUniqIT_E15__single_objectEDpOT0_[_=
ZSt11make_uniqueIN9host_tool14NetDataHandlerEJPN8ipmiblob11BlobHandlerEPNS0=
_23ProgressStdoutIndicatorERNSt7__cxx1112basic_stringIcSt11char_traitsIcESa=
IcEEESD_EENSt9_MakeUniqIT_E15__single_objectEDpOT0_]+0x64):
 undefined reference to `internal::sys_impl'</div>
<div>burn_my_bmc-main.o:main.cpp:(.text._ZSt11make_uniqueIN9host_tool14NetD=
ataHandlerEJPN8ipmiblob11BlobHandlerEPNS0_23ProgressStdoutIndicatorERNSt7__=
cxx1112basic_stringIcSt11char_traitsIcESaIcEEESD_EENSt9_MakeUniqIT_E15__sin=
gle_objectEDpOT0_[_ZSt11make_uniqueIN9host_tool14NetDataHandlerEJPN8ipmiblo=
b11BlobHandlerEPNS0_23ProgressStdoutIndicatorERNSt7__cxx1112basic_stringIcS=
t11char_traitsIcESaIcEEESD_EENSt9_MakeUniqIT_E15__single_objectEDpOT0_]+0x6=
8):
 more undefined references to `internal::sys_impl' follow</div>
<div>collect2: error: ld returned 1 exit status</div>
<div>make[3]: *** [Makefile:570: burn_my_bmc] Error 1</div>
<div>make[3]: Leaving directory '/root/phosphor-ipmi-flash/tools'</div>
<div>make[2]: *** [Makefile:725: all-recursive] Error 1</div>
<div>make[2]: Leaving directory '/root/phosphor-ipmi-flash/tools'</div>
<div>make[1]: *** [Makefile:615: all-recursive] Error 1</div>
<div>make[1]: Leaving directory '/root/phosphor-ipmi-flash'</div>
<div>make: *** [Makefile:475: all] Error 2</div>
<div>[root@localhost phosphor-ipmi-flash]#</div>
<div style=3D"box-sizing:border-box;font-family:&quot;Segoe UI&quot;, syste=
m-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-serif=
;font-size:14px">
<br>
</div>
<div style=3D"box-sizing:border-box;font-family:&quot;Segoe UI&quot;, syste=
m-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-serif=
;font-size:14px">
<br>
</div>
<br>
Thanks,</div>
<div style=3D"box-sizing:border-box;font-family:&quot;Segoe UI&quot;, syste=
m-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-serif=
;font-size:14px">
Mohaimen Alsamarai<br>
<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> William Kennington &l=
t;wak@google.com&gt;<br>
<b>Sent:</b> Thursday, November 19, 2020 11:56 PM<br>
<b>To:</b> Mohaimen Alsamarai &lt;Mohaimen.Alsamarai@fii-na.com&gt;<br>
<b>Cc:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;; XP Ch=
en &lt;Xiao-Peng.Chen@fii-na.com&gt;; Lancelot Kao &lt;lancelot.cy.kao@fii-=
na.com&gt;; Benjamin Fair &lt;benjaminfair@google.com&gt;<br>
<b>Subject:</b> Re: phosphor-ipmi-flash build error</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div>If you are installing these manually, be sure to install&nbsp;<a href=
=3D"https://github.com/martinmoene/span-lite">https://github.com/martinmoen=
e/span-lite</a> before&nbsp;building and installing stdplus and phosphor-ip=
mi-flash.</div>
<div class=3D"x_gmail_quote">
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<div lang=3D"EN-US">
<div class=3D"x_gmail-m_-5300371022549447207WordSection1"></div>
</div>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR08MB5883F020F59F625762BCE1EAB2FF0DM6PR08MB5883namp_--
