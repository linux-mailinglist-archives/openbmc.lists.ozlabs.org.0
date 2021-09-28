Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A0841AD55
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 12:54:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJbwW0VNdz2yWr
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 20:54:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=Usn0I9me;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=shuox.zhang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=Usn0I9me; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJbvw1wTkz2y8P
 for <openbmc@lists.ozlabs.org>; Tue, 28 Sep 2021 20:53:25 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="204822528"
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; 
 d="scan'208,217";a="204822528"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 03:52:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; 
 d="scan'208,217";a="478653722"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 28 Sep 2021 03:52:20 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 03:52:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 28 Sep 2021 03:52:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 28 Sep 2021 03:52:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdWDAclYDL8mj52TgumBtSVMWg2PVKEUBP9prS78Aw7CwI3U8YLADbwPJXOPvf1KjbEpM8RILkcfblvYSmy63AODqU0iE+YZ4c6mf4yYNGXEtz0eP+aQA0brQXMvz6fWJYZho13aIBPMYVHWBpydz4+f+S+HIQgZzCqhZccPsST6UnuHjEGRxqfQWY16thVTfixqdGmrzf9Xa5HCHEk0b5EoNeSJwL2GqhGMwMYtY63YYYSfhBlDiSrM9EljNps4QEtEHx26WeglAGTEEh27bWYij0I+Ev9mhJRld1c3ycMLCVLmpZT+6Hu38OmB2KK+rdLTjOEMRicy/wegamEkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=pqYsjmVdqttZCsl2LTjl8odE+dGe0ZuWdAACA1xDn/E=;
 b=dyRzFo7XV4p8R3kFfUwOlYGiIJqyQpr0Qf6YEcBYNuE9jHbrRX1T4Ov2moDaLbiMsyDhXNAgVwaK2/iYjK20GDR6kuLDCwSff+MaYp0QCOzwhSRXK2LrgVIRaRIknye02R7JG2I+8qTvUC5oRN0oOGFrGGycQq9Eh6F7ZRG+eqJW4GK2wjVZqjUPk4EqiZ9fE+uX0MJNSk8cWafDU97hvg4d4Exrfug3axDe573Ak/A90XWjyPOwsAoL+uQDqLwsV6Pz+9DF0HyVzL0c6ldKNaGidSnekHPn6ueMKxQeKvFWmPMs6Ht8AiFCa0/RgPXGnsEDIENA23oojpURw690Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqYsjmVdqttZCsl2LTjl8odE+dGe0ZuWdAACA1xDn/E=;
 b=Usn0I9mezs+2zNnqT32/dJ9o4JHek1d92dNyEWUrh64X7XdHdPBhOIUP5+hk0RzTcP0DdJr+3YCFDzXCvpwyl/g60t5v2tyjs2pexDJKT64KCLX6hA6FhNC706mus+sTSVTkTLSS3EKy5IMsiJCy1KJKPDsByN1ERTT4oWBoBhY=
Received: from DM5PR11MB1547.namprd11.prod.outlook.com (2603:10b6:4:a::15) by
 DM6PR11MB2571.namprd11.prod.outlook.com (2603:10b6:5:c7::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14; Tue, 28 Sep 2021 10:52:18 +0000
Received: from DM5PR11MB1547.namprd11.prod.outlook.com
 ([fe80::9829:6c67:d7ca:af63]) by DM5PR11MB1547.namprd11.prod.outlook.com
 ([fe80::9829:6c67:d7ca:af63%8]) with mapi id 15.20.4544.021; Tue, 28 Sep 2021
 10:52:18 +0000
From: "Zhang, ShuoX" <shuox.zhang@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: BMC clock unable to sync time offset from RTC
Thread-Topic: BMC clock unable to sync time offset from RTC
Thread-Index: Ade0UbHTB7gPaqQmRFeBL6KoCtyNPw==
Date: Tue, 28 Sep 2021 10:52:18 +0000
Message-ID: <DM5PR11MB1547467F272C74A8063A24B8E2A89@DM5PR11MB1547.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none; lists.ozlabs.org; dmarc=none action=none header.from=intel.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eba08db1-635f-439b-9c26-08d9826e0a95
x-ms-traffictypediagnostic: DM6PR11MB2571:
x-microsoft-antispam-prvs: <DM6PR11MB257176DD94EDF47697BC3EB2E2A89@DM6PR11MB2571.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:257;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N1sFNUl63Uhy3/w+i9NC2nC5O4w5iCv2YG+BUsr9PZGyjP4owZBftpSKdwgh1hjQsqgG000tLURHEXOLFOuY6zrhGfQUeNmuyWGoD+U4kpCk7nadt7Xx78GKFYLlioXorc2y8qAcbLpkl7EZ7Jw5oR8yBKkcdNxvTKzHb4V7H3cDLMencHrQEvXWnSfuVfp4NS0F4wsJAw8FBCa8YFvuSTctPYFuQyzzFIC0ra1Jv/qYCzUvMadcK6hX+JCFbRBGiSqH6fgIh02nlyTs1ErMoSCOV+5wgAdEQcCyRk3xLlM4a4jq4Oydr9KpkX/xlof9/fhx5OgZJDInev6I4UVmLx6IlaneucNkrzrP6o0mBCE61UMfPGj4D7wzUIj8uzuhSK5jC8RH9ZxNz7HCoQ3UxnUPz29MmHa/J4Nk4W4EsnKJDytyrkLPSVIcOrpUpao9ao9KGPbsoCADCCq+KnBcl1RMG6oiavfN4spy4FAZB2bBYIFyzySOO+MbIBKuGL5FGuvwvnW7K3EkfHo5J1C0iDFQ4DOq9m502WUOwfpyhS+c1KWkmflLT6CrVcJWgtxuRKgHektRWz/Ius7EJDe1P6g5vIxTVGagql6IhiNr0vmmaFzOWQ/pB5I2flnqg2MDA9PFijIsor0z+Xn2Dl2oqKaQ3TcNS9nqYnRPFqSsQUnXFCNalyJKwyWrJ0auZaoX1tlATH0B5MrmzzEq4bPrgQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1547.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(84040400005)(122000001)(52536014)(38100700002)(9326002)(83380400001)(2906002)(66556008)(66946007)(5660300002)(38070700005)(76116006)(66446008)(86362001)(66476007)(64756008)(316002)(6506007)(55016002)(8676002)(26005)(7696005)(508600001)(6916009)(71200400001)(8936002)(33656002)(186003)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nPXkuwsw/caMNN0GCOPy6vossYS18cN6KxL/XGk0t3cO+s9rQtfwzL+su6uH?=
 =?us-ascii?Q?0EN42F2EM69MBDUsndhZWlr1YiHbYRt9MWdUxmpR5O+N/SfDvyOGWChV5MJi?=
 =?us-ascii?Q?6QY/bgzTuUFKnRbvgLpz3cz4jQT9BWlSyd2ElpecVukR7CmNTzQzMJlviXdU?=
 =?us-ascii?Q?Xe5pC5k6h8zfst7FInUVCZISHkaGF6cz8a9HQQReO0/p4nhXaUpph22CGL6Z?=
 =?us-ascii?Q?a0HxIp7j0ZeS7KXfin0N/vqnJxlK5G095fPHKUD7Js2LbtWphnaftabPbQXu?=
 =?us-ascii?Q?J7wTNsCrYcJzEhd4B5J61dAGinxitfCHVuQJtsxBKyOFYkw8Qvmb8nYkr/yF?=
 =?us-ascii?Q?qpdzEiBVo6+8w+8EA7DQBT7RlnQaDE9ZYZZuENkV/izV3Vif2CA+JIe31iK1?=
 =?us-ascii?Q?CbGzxHSHLbZ3AYyJsW0YRI8Pi4Vbf31Hmu/Lit7UzIZLvxJdPQPv1ynZNTHb?=
 =?us-ascii?Q?DDOkquLNwVCprFnhk5Ay/5MUMXw8aNSVKOALZZmjlC4gE22rV6+4o4u+kauJ?=
 =?us-ascii?Q?kt2eBlgEglrgQTXPr3dWrUn3H/qfAn9y1pHYKhsEfDHfzNN1at+2AEHslgi7?=
 =?us-ascii?Q?LgtxM3lmwdJHtSlb4ud/CubfaR8d4oPxdiPVXft84wakvdc8FjdRLM1ffaRk?=
 =?us-ascii?Q?Z1M7simkGBcqV2ps50oJHz7mW0CRLJgcxPkoUU1UxrC7zCjQao3iDYQkfNge?=
 =?us-ascii?Q?NwSCKwBtZ8rFqiCSZMMnIHAPJJ9phagJBbXJe+v2ru+75AFH5A+mlxBp9LUA?=
 =?us-ascii?Q?VMQ3G95j8ii+953YhvmhuF4a9JxyaAAPBIz9i2KtWxl+4WJLHPH/FY+OMoBM?=
 =?us-ascii?Q?NHXysd+DdSLnMAhJRa//f6gKnPYJFfY/3gf/62xkGD3NBcVjeFaO9Ev2mZxa?=
 =?us-ascii?Q?oj0uu+KyDl4nM2msvAIfcxMy2HvFBB5O37M8Y99DqqsjvH7l0YkT4yUp8vdy?=
 =?us-ascii?Q?Hc2c0zrWovtY9TrbckLIWyCu7U0VmL4OC2+iDfG2RpZrGPFT4C2AuZJ4Ae+E?=
 =?us-ascii?Q?2osOYgPpRGGtoXVx9X2jcM/uSG4k6iS5gxkXfEhFop0+ZV5E6jE1hL/cJ8LA?=
 =?us-ascii?Q?ILHFrhKR9kobOdkscTA3jBiPekdRcTd+d+9O18ONuIjZOtBOm0yDlyxmagUB?=
 =?us-ascii?Q?HGNQqAsQFfg9G/vm01Xm685+HCt7YNc4oFWIDiox3w4DTxdY06j82t3wiWQC?=
 =?us-ascii?Q?msYtUIoVmfw8EAz2taZRmuoXWuE39eoXX8OjseKYrguqFtVk7mMDCWIb3gFZ?=
 =?us-ascii?Q?lAjEQIvJ5Mla0gY7pcNFTcw60Udi1b0TEysy5N7VTUtc/q0q4Uk33yVI0Hkg?=
 =?us-ascii?Q?VAA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM5PR11MB1547467F272C74A8063A24B8E2A89DM5PR11MB1547namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1547.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba08db1-635f-439b-9c26-08d9826e0a95
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 10:52:18.4606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1z/cUVTtieE1ujXpBfMqL/90eYh0QdTagXvuRTNsRD/M7ut4ZDqa2dDSUjpKqBLbsPNOURgv8eF5s5YXHJtdhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2571
X-OriginatorOrg: intel.com
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

--_000_DM5PR11MB1547467F272C74A8063A24B8E2A89DM5PR11MB1547namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
     I have a question and need your help. The time of bmc has always been =
UTC time. I set the time zone through the operating system and then reboot =
 bmc. Although the time is no longer 1970, the time is still UTC time.

     The following steps:
     1. From SUT Linux OS
     # timedatectl set-timezone Asia/Shanghai
     # hwclock -w
     # hwclock -r
     2021-08-12 23:47:04.936372+08:00

     2. Reboot BMC, the BMC will sync the clock with RTC
     3. HTTP GET /redfish/v1/Managers/bmc, check DateTime field, "DateTime"=
 =3D "2021-08-12 15:47:04.936372+00:00"

     I think it should be when the os time is synced to the bmc, the time z=
one is not passed, if I want to get the time zone time, do I need to add on=
e under the xyz.openbmc_project.Time.EpochTime interface of the xyz.openbmc=
_project.Time.Manager service Properties, or are there other ways?


root@intel-obmc:~# busctl introspect  xyz.openbmc_project.Time.Manager /xyz=
/openbmc_project/time/bmc
NAME                                TYPE      SIGNATURE  RESULT/VALUE     F=
LAGS
org.freedesktop.DBus.Introspectable interface -          -                -
.Introspect                         method    -          s                -
org.freedesktop.DBus.ObjectManager  interface -          -                -
.GetManagedObjects                  method    -          a{oa{sa{sv}}}    -
.InterfacesAdded                    signal    oa{sa{sv}} -                -
.InterfacesRemoved                  signal    oas        -                -
org.freedesktop.DBus.Peer           interface -          -                -
.GetMachineId                       method    -          s                -
.Ping                               method    -          -                -
org.freedesktop.DBus.Properties     interface -          -                -
.Get                                method    ss         v                -
.GetAll                             method    s          a{sv}            -
.Set                                method    ssv        -                -
.PropertiesChanged                  signal    sa{sv}as   -                -
xyz.openbmc_project.Time.EpochTime  interface -          -                -
.Elapsed                            property  t          1617931946881395 e=
mits-change writable






--_000_DM5PR11MB1547467F272C74A8063A24B8E2A89DM5PR11MB1547namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Trebuchet MS";
	panose-1:2 11 6 3 2 2 2 2 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Hi,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;&nbsp;&nbsp; =
&nbsp;I have a question and need your help. The time of bmc has always been=
 UTC time. I set the time zone through the operating system and then reboot=
 &nbsp;bmc. Although the time is no longer 1970, the time is
 still UTC time.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp; The following steps:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:12.0pt">&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:10.0pt;font-family:&quot;Trebuchet MS&quot;=
,sans-serif">1. From SUT Linux OS<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:10.0pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">&nbsp;&nbsp; &nbs=
p;&nbsp;# timedatectl set-timezone Asia/Shanghai<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:10.0pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">&nbsp;&nbsp;&nbsp=
; &nbsp;# hwclock -w<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:10.0pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">&nbsp;&nbsp;&nbsp=
; &nbsp;# hwclock -r<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:10.0pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">&nbsp;&nbsp;&nbsp=
;&nbsp; 2021-08-12 23:47:04.936372+<span style=3D"color:black;background:ye=
llow">08:00</span><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:10.0pt;font-family:&quot;Trebuchet MS&quot;,sans-serif"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:10.0pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">&nbsp;&nbsp;&nbsp=
;&nbsp; 2. Reboot BMC, the BMC will sync the clock with RTC<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:10.0pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">&nbsp;&nbsp;&nbsp=
;&nbsp; 3.&nbsp;HTTP GET&nbsp;/redfish/v1/Managers/bmc, check DateTime fiel=
d, &#8220;DateTime&#8221; =3D &#8220;2021-08-12 15:47:04.936372+<span style=
=3D"color:black;background:yellow">00:00</span>&#8221;<o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:10.0pt;font-family:&quot;Trebuchet MS&quot;,sans-serif"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:10.0pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">&nbsp;&nbsp;&nbsp=
;&nbsp; I think it should be when the os time is synced to the bmc, the tim=
e zone is not passed, if I want to get the time zone time, do I need
 to add one under the xyz.openbmc_project.Time.EpochTime interface of the x=
yz.openbmc_project.Time.Manager service Properties, or are there other ways=
?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:10.0pt;font-family:&quot;Trebuchet MS&quot;,sans-serif"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:10.0pt;font-family:&quot;Trebuchet MS&quot;,sans-serif"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">root@intel-obmc:~#=
 busctl introspect&nbsp; xyz.openbmc_project.Time.Manager /xyz/openbmc_proj=
ect/time/bmc<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">NAME&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; TYPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SIGNATURE&nbsp; R=
ESULT/VALUE&nbsp;&nbsp;&nbsp;&nbsp; FLAGS<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><b><span style=3D"font-=
size:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">org.freedesktop=
.DBus.Introspectable</span></b><span style=3D"font-size:9.5pt;font-family:&=
quot;Trebuchet MS&quot;,sans-serif"> interface -&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">.Introspect&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; method&nbsp;=
&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><b><span style=3D"font-=
size:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">org.freedesktop=
.DBus.ObjectManager
</span></b><span style=3D"font-size:9.5pt;font-family:&quot;Trebuchet MS&qu=
ot;,sans-serif">&nbsp;interface -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">.GetManagedObjects=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; method&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a{oa{sa{sv}}}&nbsp;&nbsp;&nbsp; -<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">.InterfacesAdded&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; signal&nbsp;&nbsp;&nbsp; oa{sa{sv}} -=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">.InterfacesRemoved=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; signal&nbsp;&nbsp;&nbsp; oas&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><b><span style=3D"font-=
size:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">org.freedesktop=
.DBus.Peer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></b><span style=3D"font-size:9.5pt;font-family:&quot;Trebuchet MS&qu=
ot;,sans-serif">&nbsp;interface -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">.GetMachineId&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; method&nbsp;&nbsp;&nbs=
p; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">.Ping&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;method&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><b><span style=3D"font-=
size:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">org.freedesktop=
.DBus.Properties&nbsp;&nbsp;&nbsp;
</span></b><span style=3D"font-size:9.5pt;font-family:&quot;Trebuchet MS&qu=
ot;,sans-serif">&nbsp;interface -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">.Get&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; method&nbsp;&nbsp;&nbsp; ss&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; v&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">.GetAll&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; method&nbsp;&nbsp;&nbsp; s&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &nbsp;a{sv}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">.Set&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; method&nbsp;&nbsp;&nbsp; ssv&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">.PropertiesChanged=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; signal&nbsp;&nbsp;&nbsp; sa{sv}as&nbsp;&nbsp; -=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><b><span style=3D"font-=
size:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">xyz.openbmc_pro=
ject.Time.EpochTime
</span></b><span style=3D"font-size:9.5pt;font-family:&quot;Trebuchet MS&qu=
ot;,sans-serif">&nbsp;interface -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">.Elapsed&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; property&nbsp; t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span style=3D"background:yellow;mso-highlight:yellow">1617931946881395</sp=
an> emits-change writable<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif"><o:p>&nbsp;</o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif"><o:p>&nbsp;</o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.5pt;font-family:&quot;Trebuchet MS&quot;,sans-serif">&nbsp;&nbsp;&nbsp;=
&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
</div>
</body>
</html>

--_000_DM5PR11MB1547467F272C74A8063A24B8E2A89DM5PR11MB1547namp_--
