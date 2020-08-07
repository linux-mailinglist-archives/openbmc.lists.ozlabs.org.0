Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C023F519
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 01:03:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNgrs0qPszDqp5
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 09:03:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=o2CIUYK2; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNgqy2jvwzDqlZ
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 09:02:48 +1000 (AEST)
IronPort-SDR: 55gAb1JaVngAHuLAIxFleXOkLrVeqytt7ACK96jTt94zvGSJhHL2MOba2uEmfIDtKi41AU+UDR
 hiieh9W4YjXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9706"; a="153180336"
X-IronPort-AV: E=Sophos;i="5.75,447,1589266800"; 
 d="scan'208,217";a="153180336"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 16:02:46 -0700
IronPort-SDR: uAB1vZU9LeXN+U/7vKct8KTKeGxHhV7wzPJR4IVL/E4cLYas8IriOpYFRg7HItGUSFwz+rg6QU
 XI0nPk3FN/3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,447,1589266800"; 
 d="scan'208,217";a="276796189"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 07 Aug 2020 16:02:45 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 7 Aug 2020 16:02:45 -0700
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 7 Aug 2020 16:02:45 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX126.amr.corp.intel.com (10.18.125.43) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 7 Aug 2020 16:02:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 7 Aug 2020 16:02:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIbhr2z2AbiFMhEaiZvR/EWbGXyCKNA+4po4BLA2GM3Ih0ZtcfrSEnl25nH5H5tAN4l2e0cRcKjiNpbaYhxgHrbyekS8adq0nkPUglMys8J8JPXjSuK5CfIEFUJsbfsEANV9PypX9Rq14A2AQsp2yACzJ4gMSP7km5GshqCwHEixDOiyhmjKkoK3ZZSTInrckRM/YDPZVGTtceL0juPJnnaxGupiZA4V4zK/ij5gm+xRceMDMpjiR6wdy0eyvh6hQvzZf6tvtZ5AoqplLL+FxIM+gggf9ZhJO45IYS79isaGhxBVI/gcU3ghCUn9ei5+tSEOsCDE/7EquDary+jyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMvuExdu2W05ThQ258QOz+fv9rthIRy5L4DUEBhCRSc=;
 b=RFYk/VNOlWlvpcydc9YvA/QJ3sKG5e5FwJSbRJoRLHqmhw7pOyDhchq+iE1EBhM8ZQ1o2EX7b63QxmUm7PlnGNAT/XUmPHvr6Pi4br7U2onoMjDHDgaG7yg0D8PqSW7qhxLTe0fdqcssw2HrEEODqy74P/GtT5FwPc8+exAa0LeQLShSePfU1xV1Lhi5OX/XTwh2zcgXdBbF8SED5nR6dJlEYPV6ciP2TshQ0PSDo5lw7KhDvfVHKTj2K7N0E6H8OzwlYWmPWEy3OXVL4EzKtYtXkxtzzj+UiJL3IKTUc9kxPjSRYee7a16qBTrEDb1yAYfV/4uZQ9dz11JevTxaTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMvuExdu2W05ThQ258QOz+fv9rthIRy5L4DUEBhCRSc=;
 b=o2CIUYK2fVQiKO9JeIU4Nib9X/d5fRMs8yMTQgRs94OdYjgKOL65KTjvgtVdIxVznBityHWQaFt/xlMHcqrVYuSRPw9iyagcvySTAqjTP1cJOeTTt/m9sXVfNQHOh1knUW9Hco+ow722SmA3Pwkn3liP/IeVtZit62qWVILH5aE=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM6PR11MB3257.namprd11.prod.outlook.com (2603:10b6:5:5c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Fri, 7 Aug
 2020 23:02:42 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d02d:3a87:869f:1544]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d02d:3a87:869f:1544%5]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 23:02:42 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: CI job is failing on with lto for libipmi
Thread-Topic: CI job is failing on with lto for libipmi
Thread-Index: AdZtDtmulSnx7UADRX2mnutLzV8qCw==
Date: Fri, 7 Aug 2020 23:02:42 +0000
Message-ID: <DM6PR11MB44102FC343DC712C174CD37F94490@DM6PR11MB4410.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none; lists.ozlabs.org; dmarc=none action=none header.from=intel.com; 
x-originating-ip: [73.11.44.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e7ae091-d332-4641-c399-08d83b25fd7f
x-ms-traffictypediagnostic: DM6PR11MB3257:
x-microsoft-antispam-prvs: <DM6PR11MB3257C1325BFB5E65D301C24394490@DM6PR11MB3257.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jF1u5xnaie8rTZwCPhzQGa62SIwpt/mqpmZ0vxYC5sfOsbauIXf2nhUvo/NML3k5KXIJGKB9dwmr7w3SXlrXvDe/WaeWQuMoKrnrCziGS8CyTRSK+PKqBsrYvQ4AKeiLn3mT+Tu4NFgYD5G0gvCoRaOnMIki0+WvQEDgK5z9wqPvUXb73JdIMhScA7dhPPHJix7WAq+M9xXg2f7nZUATXU5YWcZLaTgjQP2aoZBu5fWuqOTsvJ3770FnWxjqY4Lz5wP0SnIbveyssVTO0nf8eQyuKDQuNxNcTWhv16Lu/evzTUhL8dfy+TJwkmIswVQA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(71200400001)(64756008)(66476007)(76116006)(52536014)(66946007)(5660300002)(66446008)(66556008)(316002)(4744005)(6916009)(2906002)(86362001)(8936002)(8676002)(83380400001)(26005)(6506007)(478600001)(33656002)(9686003)(55016002)(186003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: GYfZpiFk9CUqLmga3x4jF+4nI6YI9LX6pqUgrvVbNjJkbOBANyG7WwlQAM5AdcXX5j62duX9reCaixn3/0cLTMe47+equachSMSnkGaZvli4IHaVwJyaN64wAk1z7HG+tjnW/Q3LHTO324v12AhV3fBsJF9W5N/Z+6lgpCur/lFiPE/MJ7QFietlGnx1EwK0Hm1XJMfUZk/IMil4BAFWWRP0zYyw7j9gNRJNULDABS6IPU4p4JZ2ZQonF7UxQ8UjABpJ2kseO5RFgPAjE6ioqlW/gL4bigU35AaaNKqzQ2QVB2xDS+JR3mLQAZFqYjk8y+J6HE383NjZwAjAcuTVMJgKZkF/t+2EjZgDrc9mfo8YVQqTEqK27GvO6XGHTa33SMcGMrc6MKw7Coe51xU9LQRAzoslo2pX73sruRluwWchBtucphs+PN/pScReVlJxUy0SncmWpnimySASYO+rcVHSRm/pcRmNcAZKN3Kvf580g7IHbod/HNe/t8AcbgplBvdQjZng8pXQ5EiMbzbdcjhbjg1tgCPS+IUiW58VgXNll8olY7Fji2PDLtJ/LPhqcc77Wi+G6+cw/2BQWauBVwulVvvbzFpeK+XkxvmpPT/fBYzFsxx7TMiAd5qHXVVVbiFfo/m3gINFComiccovww==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR11MB44102FC343DC712C174CD37F94490DM6PR11MB4410namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7ae091-d332-4641-c399-08d83b25fd7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2020 23:02:42.4313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K45ikLDFEW7wUPPON6dODZ7q8NRV73mMECap7MbUbb6SB7NrSVil5b9a0DZMtf89gsnMlCveGP2jLfS8LQEIlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3257
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

--_000_DM6PR11MB44102FC343DC712C174CD37F94490DM6PR11MB4410namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Does anyone know what could be causing this CI build failure?


gnu/crtn.o  -flto -g -O2   -Wl,-soname -Wl,libipmi20.so.0 -o .libs/libipmi2=
0.so.0.0.0

during IPA pass: cp

lto1: internal compiler error: Segmentation fault

Please submit a full bug report,

with preprocessed source if appropriate.

See <file:///usr/share/doc/gcc-10/README.Bugs<file://usr/share/doc/gcc-10/R=
EADME.Bugs>> for instructions.

lto-wrapper: fatal error: g++ returned 1 exit status

compilation terminated.

/usr/bin/ld: error: lto-wrapper failed

collect2: error: ld returned 1 exit status

make[2]: *** [Makefile:1112: libipmi20.la] Error 1




I noticed this failure from one of my reviews in phosphor-net-impi.
I pushed a white space change for testing, it failed the same way.
I just saw it failed the same way with a Gerrit review for phosphor-pid-con=
trol,
which means no change in the phosphor-net-ipmi.

Thanks,
Zhikui



--_000_DM6PR11MB44102FC343DC712C174CD37F94490DM6PR11MB4410namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
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
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Does anyone know what could be causing this CI build=
 failure?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<pre><span style=3D"font-size:10.5pt;color:#333333">gnu/crtn.o&nbsp; -flto =
-g -O2&nbsp;&nbsp; -Wl,-soname -Wl,libipmi20.so.0 -o .libs/libipmi20.so.0.0=
.0<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.5pt;color:#333333">during IPA pass: cp<o:p=
></o:p></span></pre>
<pre><span style=3D"font-size:10.5pt;color:#333333">lto1: internal compiler=
 error: Segmentation fault<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.5pt;color:#333333">Please submit a full bu=
g report,<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.5pt;color:#333333">with preprocessed sourc=
e if appropriate.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.5pt;color:#333333">See &lt;<a href=3D"file=
://usr/share/doc/gcc-10/README.Bugs"><span style=3D"color:#5C3566">file:///=
usr/share/doc/gcc-10/README.Bugs</span></a>&gt; for instructions.<o:p></o:p=
></span></pre>
<pre><span style=3D"font-size:10.5pt;color:#333333">lto-wrapper: fatal erro=
r: g++ returned 1 exit status<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.5pt;color:#333333">compilation terminated.=
<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.5pt;color:#333333">/usr/bin/ld: error: lto=
-wrapper failed<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.5pt;color:#333333">collect2: error: ld ret=
urned 1 exit status<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.5pt;color:#333333">make[2]: *** [Makefile:=
1112: libipmi20.la] Error 1<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.5pt;color:#333333"><o:p>&nbsp;</o:p></span=
></pre>
<pre><span style=3D"font-size:10.5pt;color:#333333"><o:p>&nbsp;</o:p></span=
></pre>
<p class=3D"MsoNormal">I noticed this failure from one of my reviews in pho=
sphor-net-impi.<o:p></o:p></p>
<p class=3D"MsoNormal">I pushed a white space change for testing, it failed=
 the same way.<o:p></o:p></p>
<p class=3D"MsoNormal">I just saw it failed the same way with a Gerrit revi=
ew for phosphor-pid-control,<o:p></o:p></p>
<p class=3D"MsoNormal">which means no change in the phosphor-net-ipmi.<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Zhikui<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR11MB44102FC343DC712C174CD37F94490DM6PR11MB4410namp_--
