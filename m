Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EA417B147
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 23:14:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YQ5S4H1YzDqrm
	for <lists+openbmc@lfdr.de>; Fri,  6 Mar 2020 09:14:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=0333259e98=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=m35e9tLF; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=PT4w4OKG; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YQ4P1QHSzDqcw
 for <openbmc@lists.ozlabs.org>; Fri,  6 Mar 2020 09:13:19 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 025M00KF030862; Thu, 5 Mar 2020 14:13:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=1kq4vJTTvRqHrJwHLPszhVoJm9KsW93BfZI6mwdFbl8=;
 b=m35e9tLFF0y0PnpS4DVnT2NkjNuekfHPmahKpofNTrbVV7aHzWZZ0qTqjfWipm5Mpq+y
 /SPM8Da4cToqq80/yhHiCKpvbHxpjuBdkl3b8IeKoyhJvFSk691ZfQWQ0saJlXGo/bwl
 DmeIjY1a3tzjYM0cx+xws/x0pcpr/BRaumE= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 2yjk74xhsu-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 05 Mar 2020 14:13:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 5 Mar 2020 14:13:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZJ5KMTBDEM6mjjNBZ+JDSrrIFGQP9cYQrmcfZK+Wig3poXV3TmTh3Miqb8bXpU8UjHIGCsfnKGFB771GgaxtcHhNnb7akax/NExUVZyqHxF8351dUzw4dCmey0WPb8k5RCEEYfmgPP5woZe5pg0x3ujfrFVFSwgdAE22ezL803xocMGnJ8JbWNLGEibBgWqCjhEJVJ09RtA5jc5Rt4QC3sOIvlYCSmwmpDyuyKgMEWLPKXizSWXeA4+xc+PvUu/+eHNWNahJrISPptGJcrJRFzP+WLTQWYxPvy+3dHz1MzMcoKEFfw6vf7H804uLJrVdT/fQL1Zx+kAs91GbqDmqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kq4vJTTvRqHrJwHLPszhVoJm9KsW93BfZI6mwdFbl8=;
 b=DE9HYMcIDTduhZZ7jObCal2+TP2g+YaXqVXHmrvZhx5aPeGuVmZlqK4Kz6fzS++qSCfDd6/2ZqNHnTvT5/ZGHYi8fzxPhiUeDtlMZ8FmCKhdJYSn0qM+W5Pau+QqV/eViNN7YMpRC2eL9OdL2ftoTzb1HiACvY1/7Q5zQ++XIBea6Nb2WYAV5b2TpmUTK5ZaPLnhWXcdE6P6g/GieRp9BdomvI8k2RROa99+WHAGjhkdBjkDf8quqhZsWv93hu1oAd/hXUx00pHt48GvwQ8daFTpHgCMLi877WQ3I39xYtVUSV30bzlUmv3tiep44e1sWlGztCgpz3yal2NkBMH0Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kq4vJTTvRqHrJwHLPszhVoJm9KsW93BfZI6mwdFbl8=;
 b=PT4w4OKG+jr+v504SuxEP2fS64N22ltswCdEhv7GzuK0AQDsoVQ2lR0daVAmXTU41WTk7VyxXOomiOjO7D0RY6qgGjeqDHxBcMbzfTFcJEDYdDdL7db2OxOSy65rGd353yzVP68WQuPvdNfl4rGNXngJRjf4ad+V1POTNac6VEI=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3817.namprd15.prod.outlook.com (2603:10b6:303:4d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14; Thu, 5 Mar
 2020 21:58:22 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 21:58:22 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: obmc-console design for multi host support
Thread-Topic: obmc-console design for multi host support
Thread-Index: AQHV54I/nLHE21W9uEuIi5D/dIqKpKgj/zQAgAmtGoCAAS9LgIAHeveAgAPGrYA=
Date: Thu, 5 Mar 2020 21:58:22 +0000
Message-ID: <F0FD3E1A-1CB4-48B1-B56B-9D03167ABEDE@fb.com>
References: <SG2PR04MB3029CF9F520DF543B57B93C2FD100@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <f136d4ad-65e6-4e74-8f53-2ca3edaf9288@www.fastmail.com>
 <SG2PR04MB30295AD664D4B5BD5F24EFD3FD130@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <SG2PR04MB302996468E42284DE73358A6FDEA0@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <5dd6cbbe-5f58-4370-82c7-55c8dc22ca5b@www.fastmail.com>
 <2e540aa6-1540-46b2-af33-57ddb5ec9554@www.fastmail.com>
In-Reply-To: <2e540aa6-1540-46b2-af33-57ddb5ec9554@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:500::4:33c9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 518ff94f-3c65-46a9-49e4-08d7c15052bf
x-ms-traffictypediagnostic: MW3PR15MB3817:
x-microsoft-antispam-prvs: <MW3PR15MB3817E3AD952E498E0C2BFE70DDE20@MW3PR15MB3817.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(189003)(199004)(33656002)(6506007)(64756008)(66446008)(66946007)(66556008)(8936002)(66476007)(186003)(71200400001)(6512007)(8676002)(5660300002)(498600001)(2906002)(86362001)(81166006)(81156014)(2616005)(76116006)(36756003)(4326008)(6916009)(966005)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW3PR15MB3817;
 H:MW3PR15MB3947.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6yT92EdrifYrUorqN69fYN79NWelwu4khdzRAT3IsaD3zxEN/AzFqM8n+OV2l0W+aQYe1Wr83xTZY1hYt5KecmVTu+NJIJ+izNYGfYyBDsOsX144Wv5e3c7LLm4uhwZIXTtPvsbsZ8s/9IHRYo8+rxCz78k4/KihMsLv7bNpgcUYOFc5Z0C5TeP6QuIpMBFckCebHhyta9Yn9ctEqSnpaMZ1hAk3Nac3Zyfk2YzGqTx9lhQjCLItMitzrFBJBMP9iYon4aO7erGTRqQ1RIbgP7QzvVGg0mNI+ZyeSWCoqRQAwM1Qq9c1D39RpAbCAd4Nd0XB4ciMK1HjlQMGerk7W5+ODEhRncsK4PwEp5Q+LKLfa/k4Yq76hN/cMB5inQW0uimSfVlP1O3ZFEDGRTuO3CyaskYmg1AoPp39YMWFpCcPoFgAMDTiKgKGUI4ik5rC8CA1ljZWT1LNrn1colbkloDmc6TJ95aoRSRr4OCCAs2O4JWI41NNKQcffWNQjw1GCpU3c6hBkS4b3sQ3nKBz/A==
x-ms-exchange-antispam-messagedata: 5f5k5OzD2GpCG2TkqA0g60RFKBYSqWwi12QRoEMNxzbhUzQZAdSQBqoveuvbEispBU74zCAYD/Jx4+5eWKsDcxh93oxBzGlz/6sBAvWN6LQzjoGMjE4G//DE6eMOtb2bVtMDcRdOJyaZML1KQ7M79e3drHWITFU2zDVH0voyeGGOREEmYzct+pQuTq01HMEa
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F52B207065441478E532DD2330A2FCC@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 518ff94f-3c65-46a9-49e4-08d7c15052bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 21:58:22.4882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TcyLgRl1e+mOAvwQ3jRJZxDO+4vz/0dYrVhl41WlSZEYc4QiEXWMX1zG7a4SOvipqX5WqiVkcHOgOAL60yFtPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3817
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-05_07:2020-03-05,
 2020-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=1
 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=1 mlxlogscore=216 mlxscore=1 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050126
X-FB-Internal: deliver
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

SGkgQW5kcmV3LA0KSSBoYXZlIGEgcXVlc3Rpb24gYXMgd2h5IGRvIHdlIG5lZWQgb2JtYy1jb25z
b2xlLXNzaC5zb2NrZXQgYW5kIG9ibWMtY29uc29sZS1zc2hALnNlcnZpY2UuIA0KRXNwZWNpYWxs
eSB3aGVuIHVzaW5nIGluIGNvbmN1cnJlbnQgc2VydmVycyBkbyB3ZSBuZWVkIHRvIGNyZWF0ZSB0
aGVzZSBmb3IgZWFjaCBjbGllbnQvc2VydmVyIHNvY2tldD8NCg0KVGhpcyBtYXkgYmUgYSBiYXNp
YyBxdWVzdGlvbiBidXQgSSB3YW50IHRvIHVuZGVyc3RhbmQgdGhpcyBtb3JlLg0KDQpSZWdhcmRz
DQotVmlqYXkNCg0K77u/T24gMy8yLzIwLCA4OjE5IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2Yg
QW5kcmV3IEplZmZlcnkiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3Rz
Lm96bGFicy5vcmcgb24gYmVoYWxmIG9mIGFuZHJld0Bhai5pZC5hdT4gd3JvdGU6DQoNCiAgICAN
CiAgICANCiAgICBPbiBUaHUsIDI3IEZlYiAyMDIwLCBhdCAyMDozNCwgQW5kcmV3IEplZmZlcnkg
d3JvdGU6DQogICAgDQogICAgPiANCiAgICA+IFlvdSdsbCBuZWVkIGEgLmJiYXBwZW5kIGZpbGUg
d2l0aCBhIGRvX2luc3RhbGxfYXBwZW5kKCkgaW4geW91ciBtYWNoaW5lDQogICAgPiBsYXllciB0
byBpbnN0YWxsIHRoZSByZXN0IG9mIHlvdXIgY29uZmlndXJhdGlvbiBmaWxlcy4NCiAgICA+IA0K
ICAgIA0KICAgIEp1c3QgZm9sbG93aW5nIHVwIG9uIHRoZSAuYmJhcHBlbmQgLSB0aGUgY2hhbmdl
IGZvciB0aGUgYmFzZSByZWNpcGUgaXMgaGVyZToNCiAgICANCiAgICBodHRwczovL3VybGRlZmVu
c2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2dlcnJpdC5vcGVuYm1jLTJEcHJv
amVjdC54eXpfY19vcGVuYm1jX21ldGEtMkRwaG9zcGhvcl8tMkJfMjk3NDdfMV9yZWNpcGVzLTJE
cGhvc3Bob3JfY29uc29sZV9vYm1jLTJEY29uc29sZS01RmdpdC5iYiZkPUR3SUJBZyZjPTVWRDBS
VHRObFRoM3ljZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2WGtrY3JJYXFV
N1VTbDVnJm09MS1DeHRBa1RMRXRwbXJ3MHpOeGFKV0RXS0MxbjN6TUVQU1dFcnpnejZPdyZzPTRG
MFlDTEl3WV8ybk50b05RM25oa1BsTjFpVTFkOE8yRVgzY09odHo4bm8mZT0gDQogICAgDQogICAg
SW4gdGhhdCBjb250ZXh0LCAuYmJhcHBlbmRzIGZvciBlbmFibGluZyBjb25jdXJyZW50IGNvbnNv
bGUgc2VydmVycyBzaG91bGQNCiAgICBsb29rIHNvbWV0aGluZyBsaWtlIHRoaXMgZm9yIGFuIGV4
YW1wbGUgbWFjaGluZSBjYWxsZWQgJ2Zvbyc6DQogICAgDQogICAgYGBgDQogICAgRklMRVNFWFRS
QVBBVEhTX3ByZXBlbmQgOj0gIiR7VEhJU0RJUn0vJHtQTn06Ig0KICAgIA0KICAgIFNSQ19VUkkg
Kz0gImZpbGU6Ly9zZXJ2ZXIudHR5VlVBUlQwLmNvbmYiDQogICAgU1JDX1VSSV9hcHBlbmRfZm9v
ID0gIiBmaWxlOi8vY2xpZW50LjIyMDEuY29uZiINCiAgICBTUkNfVVJJX2FwcGVuZF9mb28gPSAi
IGZpbGU6Ly9zZXJ2ZXIudHR5VlVBUlQxLmNvbmYiDQogICAgDQogICAgU1JDX1VSSV9yZW1vdmUg
PSAiZmlsZTovLyQlN0JCUE4lN0QuY29uZiINCiAgICANCiAgICBSRUdJU1RFUkVEX1NFUlZJQ0VT
XyR7UE59X2FwcGVuZF9mb28gPSAiIG9ibWNfY29uc29sZV9ndWVzdHM6dGNwOjIyMDE6Ig0KICAg
IA0KICAgIFNZU1RFTURfU0VSVklDRV8ke1BOfV9hcHBlbmRfZm9vID0gIiBvYm1jLWNvbnNvbGUt
c3NoQDIyMDAuc2VydmljZSBcDQogICAgCQlvYm1jLWNvbnNvbGUtc3NoQDIyMDEuc2VydmljZSBc
DQogICAgICAgICAgICAgICAgICAgICINCiAgICBTWVNURU1EX1NFUlZJQ0VfJHtQTn1fcmVtb3Zl
X2ZvbyA9ICJvYm1jLWNvbnNvbGUtc3NoLnNvY2tldCINCiAgICANCiAgICBGSUxFU18ke1BOfV9y
ZW1vdmVfZm9vID0gIi9saWIvc3lzdGVtZC9zeXN0ZW0vb2JtYy1jb25zb2xlLXNzaEAuc2Vydmlj
ZS5kL3VzZS1zb2NrZXQuY29uZiINCiAgICANCiAgICBFWFRSQV9PRUNPTkZfYXBwZW5kX2ZvbyA9
ICIgLS1lbmFibGUtY29uY3VycmVudC1zZXJ2ZXJzIg0KICAgIA0KICAgIGRvX2luc3RhbGxfYXBw
ZW5kX2ZvbygpIHsNCiAgICAgICAgICAgICMgSW5zdGFsbCBjb25maWd1cmF0aW9uIGZvciB0aGUg
c2VydmVycyBhbmQgY2xpZW50cy4gS2VlcCBjb21tYW5kbGluZQ0KICAgICAgICAgICAgIyBjb21w
YXRpYmlsaXR5IHdpdGggcHJldmlvdXMgY29uZmlndXJhdGlvbnMgYnkgZGVmYXVsdGluZyB0byBu
b3QNCiAgICAgICAgICAgICMgc3BlY2lmeWluZyBhIHNvY2tldC1pZCBmb3IgVlVBUlQwLzIyMDAN
CiAgICAgICAgICAgIGluc3RhbGwgLW0gMDc1NSAtZCAke0R9JHtzeXNjb25mZGlyfS8ke0JQTn0N
CiAgICANCiAgICAgICAgICAgICMgUmVtb3ZlIHRoZSBkZWZhdWx0IGNsaWVudCBjb25maWd1cmF0
aW9uIGFzIHdlIGRvbid0IHRvIGRlZmluZSBhDQogICAgICAgICAgICAjIHNvY2tldC1pZCBmb3Ig
dGhlIDIyMDAgY29uc29sZQ0KICAgICAgICAgICAgcm0gLWYgJHtEfSR7c3lzY29uZmRpcn0vJHtC
UE59L2NsaWVudC4yMjAwLmNvbmYNCiAgICANCiAgICAgICAgICAgICMgSG93ZXZlciwgbm93IGxp
bmsgdG8gL2Rldi9udWxsIGFzIGEgd2F5IG9mIG5vdCBzcGVjaWZ5aW5nIGENCiAgICAgICAgICAg
ICMgc29ja2V0LWlkIHdoaWxlIGhhdmluZyBhIGNvbmZpZ3VyYXRpb24gZmlsZSBwcmVzZW50LiBX
ZSBuZWVkIHRvDQogICAgICAgICAgICAjIHByb3ZpZGUgYSBjb25maWd1cmF0aW9uIHBhdGggdG8g
bWVldCB0aGUgcmVxdWlyZW1lbnRzIG9mIHRoZSBwYWNrYWdlZA0KICAgICAgICAgICAgIyB1bml0
IGZpbGUuDQogICAgICAgICAgICBsbiAtc3IgJHtEfS9kZXYvbnVsbCAke0R9JHtzeXNjb25mZGly
fS8ke0JQTn0vY2xpZW50LjIyMDAuY29uZg0KICAgIA0KICAgICAgICAgICAgIyBXZSBuZWVkIHRv
IHBvcHVsYXRlIHNvY2tldC1pZCBmb3IgcmVtYWluaW5nIGNvbnNvbGVzDQogICAgICAgICAgICBp
bnN0YWxsIC1tIDA2NDQgJHtXT1JLRElSfS9jbGllbnQuMjIwMS5jb25mICR7RH0ke3N5c2NvbmZk
aXJ9LyR7QlBOfS8NCiAgICANCiAgICAgICAgICAgICMgSW5zdGFsbCBjb25maWd1cmF0aW9uIGZv
ciByZW1haW5pbmcgc2VydmVycyAtIHRoZSBiYXNlIHJlY2lwZQ0KICAgICAgICAgICAgIyBpbnN0
YWxscyB0aGUgY29uZmlndXJhdGlvbiBmb3IgdGhlIGZpcnN0Lg0KICAgICAgICAgICAgaW5zdGFs
bCAtbSAwNjQ0ICR7V09SS0RJUn0vc2VydmVyLnR0eVZVQVJUMS5jb25mICR7RH0ke3N5c2NvbmZk
aXJ9LyR7QlBOfS8NCiAgICB9DQogICAgYGBgDQogICAgDQogICAgSG9wZSB0aGF0IGhlbHBzLg0K
ICAgIA0KICAgIEFuZHJldw0KICAgIA0KDQo=
