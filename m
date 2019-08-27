Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E09F1CA
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 19:40:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hx3P2lYgzDqkS
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 03:40:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.77.128; helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="iKowEYgC"; dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770128.outbound.protection.outlook.com [40.107.77.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hx2h03zYzDqgB
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 03:39:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcH6F3LZ5p97E1h8SglIwUQEc4mJt9eLri1kVUj2XpRI/BHABpgpk2hTlpSKPLcFk+ETUzgeFm8sXnTWEIB49HyX6DKW3uxnkIeJDki0IbfM1G/qBWfDbpw/hS0gE2uNIaEcFDys7Wde8RZ53WAOgKo/Ap8cP84oA+L7FDLAQVqUwCrGvrH9+pZ0qDKE+kuzp/+QqfxEGLFAqPLuhI54EUZJ4nFCczbrWDzQo8TwDhuUo77SL+l93W6ceSrb88DM03FdepbW34I4RWzQJ5hRPw9qbs6If5rjoLPbEsDb6tv1hvsO0OeMzc1T9mqbLie3hN22of0FET/R8Ih29rpahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0MJu8H26KdwDVmnihJ0MaR/3Hyq6cMsC2WEcPRRkbs=;
 b=UQr0JbjqTQk2wfbSFx0u4lkMcKj4g87td6SY+KLO+jp4UwTPhCS9XtNjthgE1lQ04RT4qdELzggADlR+zBlJ5Z3rAHQZKqUc+nt9Gm5K28sAh/cUBr5wegKE/gFKPELu0zETAO0juLP2+76WsFWfkWgJFA1lP1E+GhCB1Lik8MbluL7K7QfPLZf09qPix8ZMeYdvYSRee67XRT+LvBqI5bPbEsgifQMTrirY1SwRJ45Ku+uamyAbRqW4bA4Xgv/F3SoL8RCuzlEGRTZafKAzJfimQgbHaPmG/40bTUCk76PeN62f9rYGKyESd7OhRK6n4sUNtQvemJGK08Bdll5AGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0MJu8H26KdwDVmnihJ0MaR/3Hyq6cMsC2WEcPRRkbs=;
 b=iKowEYgCIMrv9g0lKFkVRrz1DR4AvEPk/ZOZwp5djsqdPOshqi4nv818751lIwfaBZTLnDcAGe1JAeu0oowXKGPA259nV0/clBPazDqxf7xoXLKJchHzVmWORAYBUCU4MSXXziMAymsMZgYNJ6DmdvKQJfV1c7DN5Wn5dXDQ0Tk=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1271.namprd21.prod.outlook.com (20.179.57.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.1; Tue, 27 Aug 2019 17:39:33 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e805:a5bc:9f69:771b]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e805:a5bc:9f69:771b%9]) with mapi id 15.20.2241.000; Tue, 27 Aug 2019
 17:39:33 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Platform telemetry and health monitoring - PST PM 
Thread-Topic: Platform telemetry and health monitoring - PST PM 
Thread-Index: AdVc/l9mN7XdRxQ0RVCmQ3nrpx0Qtg==
Date: Tue, 27 Aug 2019 17:39:33 +0000
Message-ID: <BYAPR21MB1191314BF7B11D94C2B3A485C8A00@BYAPR21MB1191.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-05-20T20:24:51.7634725Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=7ad7e3a0-0fda-4efe-b5af-bd9df99a438a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:7:78b5:dd69:44fd:ea0e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37e9a962-88b1-423d-c896-08d72b15860b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR21MB1271; 
x-ms-traffictypediagnostic: BYAPR21MB1271:
x-ms-exchange-purlcount: 9
x-microsoft-antispam-prvs: <BYAPR21MB127114FB5F556491AF82CD5BC8A00@BYAPR21MB1271.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(199004)(189003)(53754006)(256004)(14444005)(8990500004)(1730700003)(74316002)(33656002)(6246003)(5660300002)(476003)(6916009)(478600001)(81156014)(8676002)(54906003)(966005)(2906002)(7736002)(14454004)(10090500001)(54896002)(4743002)(6306002)(66946007)(64756008)(66446008)(76116006)(66476007)(55016002)(66556008)(486006)(52536014)(5640700003)(9686003)(6436002)(606006)(86362001)(2351001)(53936002)(236005)(7696005)(46003)(2501003)(81166006)(790700001)(25786009)(4326008)(10290500003)(229853002)(6116002)(316002)(8936002)(102836004)(53546011)(71190400001)(6506007)(71200400001)(99286004)(22452003)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1271;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ObWnM8ztytEXUujLFy6YS6OxpfIZ6md/XjCirZQKlSQjNiRgdpsu+KtVBZDmTdQmpwmAX7JdJLqQd0pu7EuX07pU8RJenvVN6SdGWAAHm7jez4xJfjGZbKKFaq5OfHt5Z+zB6cK5p6oW67Yl5jw8S9/s+l9KT36YDuetnq9cR+oyQyxWVc+dQ0nmw1E/wUqC4MD5oq+yemJTvMcJzIhRxdDLl+gK2S98Gr0G4I0uwPL/On1wiZpKaTK/nUeM3PTZKZcpDCT1M3mKx3wDOendzBxfzElL0ztmd9Ny+lPVGAE2uik8YZ0xecdfiKrxkFppjRbNLs9jVRM6f16Lg/rCyN/CmghnBm07jqsb/K5QK3yhUwghYkAnEWMSq9AHIaENG9kjm3UNVpDsL+4c2fHuyPsfifDgIQilEpiwMIG6s0c=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR21MB1191314BF7B11D94C2B3A485C8A00BYAPR21MB1191namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e9a962-88b1-423d-c896-08d72b15860b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 17:39:33.8182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4O2J3CyLArAE4zqtXrmPUpH1yXEJj4DjI1PpYkqlL2f7FqJhfnJOk2lloDDfGVnvhwrzWhjfDeVSJvJdbfrPsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1271
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
Cc: "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BYAPR21MB1191314BF7B11D94C2B3A485C8A00BYAPR21MB1191namp_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

SGVsbG8uDQoNClRoaXMgaXMgcmVtaW5kZXIgZm9yIHRvZGF5oa9zIE9wZW5CTUMgcGxhdGZvcm0g
dGVsZW1ldHJ5IHdvcmtncm91cCBtZWV0aW5nICggVHVlc2RheSAwOC8yNyAtICA5OjMwIFBNIFBT
VCkNCg0KVGhhbmtzDQpOZWVyYWoNCg0KDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMr
bmVsYWRrPW1pY3Jvc29mdC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIE5lZXJh
aiBMYWRrYW5pDQpTZW50OiBNb25kYXksIEF1Z3VzdCA1LCAyMDE5IDU6MDcgUE0NClRvOiBvcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmcNCkNjOiBQYXVsLlZhbmNpbEBkZWxsLmNvbQ0KU3ViamVjdDog
UkU6IFBsYXRmb3JtIHRlbGVtZXRyeSBhbmQgaGVhbHRoIG1vbml0b3JpbmcgLSBQU1QgQU0NCg0K
SGVsbG8gRXZlcnlvbmUuDQoNClRoaXMgaXMgYSByZW1pbmRlciBmb3IgdG9tb3Jyb3ehr3MgT3Bl
bkJNQyBwbGF0Zm9ybSB0ZWxlbWV0cnkgd29ya2dyb3VwIG1lZXRpbmcgKCBUdWVzZGF5IDA4LzA2
IC0gIDk6MzAgQU0gUFNUKQ0KDQpOZWVyYWoNCg0KLS0tLS1PcmlnaW5hbCBBcHBvaW50bWVudC0t
LS0tDQpGcm9tOiBOZWVyYWogTGFka2FuaQ0KU2VudDogVHVlc2RheSwgSnVuZSA0LCAyMDE5IDEy
OjA5IEFNDQpUbzogTmVlcmFqIExhZGthbmk7IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzxtYWls
dG86b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KQ2M6IEpvZSBQIE11bGhvbGxhbmQ7IEx1a2Ug
Q2hlbjsgTWF0dCBDaGVuL1dZSFEvV2l3eW5uOyBEb25nIFdlaTsgSml0ZW5kcmFfS3VtYXI0QERl
bGwuY29tPG1haWx0bzpKaXRlbmRyYV9LdW1hcjRARGVsbC5jb20+OyBSZWVkIEIgRnJhbmRzZW47
IE1pY2hhZWwgTGltOyBCdWRkeSBIdWFuZyAo/Nz0uPv4KTsgVG9tIFNhbmQ7IEFzbWFhIE1uZWJo
aTsgUGF1bC5WYW5jaWxAZGVsbC5jb208bWFpbHRvOlBhdWwuVmFuY2lsQGRlbGwuY29tPjsgVGFu
b3VzLCBFZDsgQ2hyaXN0b3BoZXIgQm9zdGljOyBKYW1lcyBNb3JzZTsgVmlqYXkgS2hlbWthDQpT
dWJqZWN0OiBQbGF0Zm9ybSB0ZWxlbWV0cnkgYW5kIGhlYWx0aCBtb25pdG9yaW5nIC0gUFNUIEFN
DQpXaGVuOiBUdWVzZGF5LCBBdWd1c3QgNiwgMjAxOSA5OjMwIEFNLTEwOjMwIEFNIChVVEMtMDg6
MDApIFBhY2lmaWMgVGltZSAoVVMgJiBDYW5hZGEpLg0KV2hlcmU6IE1pY3Jvc29mdCBUZWFtcyBN
ZWV0aW5nDQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvd2lraS9QbGF0Zm9y
bS10ZWxlbWV0cnktYW5kLWhlYWx0aC1tb25pdG9yaW5nLVdvcmstR3JvdXA8aHR0cHM6Ly9uYW0w
Ni5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0
aHViLmNvbSUyRm9wZW5ibWMlMkZvcGVuYm1jJTJGd2lraSUyRlBsYXRmb3JtLXRlbGVtZXRyeS1h
bmQtaGVhbHRoLW1vbml0b3JpbmctV29yay1Hcm91cCZkYXRhPTAyJTdDMDElN0NuZWxhZGslNDBt
aWNyb3NvZnQuY29tJTdDNGEwOWRmNmY5NmE2NDVjMTFhNTYwOGQ3MWEwMjIxNWQlN0M3MmY5ODhi
Zjg2ZjE0MWFmOTFhYjJkN2NkMDExZGI0NyU3QzElN0MwJTdDNjM3MDA2NDY4NzY2NDUyMjUwJnNk
YXRhPTZGbXdvWWZtJTJGRDg5M0t4ekVqekFYdmdMbSUyQlV3YlFWUDltemlJeUJDdVFrJTNEJnJl
c2VydmVkPTA+DQoNCg0KDQoNCkpvaW4gTWljcm9zb2Z0IFRlYW1zIE1lZXRpbmc8aHR0cHM6Ly90
ZWFtcy5taWNyb3NvZnQuY29tL2wvbWVldHVwLWpvaW4vMTklM2FtZWV0aW5nX01EVTFORE0yWTJF
dE9UWmtZeTAwWmpJNUxUa3pNRGN0TWpNeFpEWXlOemxoTmpReSU0MHRocmVhZC52Mi8wP2NvbnRl
eHQ9JTdiJTIyVGlkJTIyJTNhJTIyNzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3
JTIyJTJjJTIyT2lkJTIyJTNhJTIyMWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYzY1
JTIyJTdkPg0KKzEgMzIzLTg0OS00ODc0PHRlbDorMSUyMDMyMy04NDktNDg3NCwsNzM1NzI4NDIj
PiAgIFVuaXRlZCBTdGF0ZXMsIExvcyBBbmdlbGVzIChUb2xsKQ0KKDg2NikgNjc5LTk5OTU8dGVs
Oig4NjYpJTIwNjc5LTk5OTUsLDczNTcyODQyIz4gICAoVG9sbC1mcmVlKQ0KQ29uZmVyZW5jZSBJ
RDogNzM1IDcyOCA0MiMNCkxvY2FsIG51bWJlcnM8aHR0cHM6Ly9uYW0wNi5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZGlhbGluLnRlYW1zLm1pY3Jv
c29mdC5jb20lMkY4NTUxZjRjMS1iZWEzLTQ0MWEtODczOC02OWFhNTE3YTkxYzUlM0ZpZCUzRDcz
NTcyODQyJmRhdGE9MDIlN0MwMSU3Q25lbGFkayU0MG1pY3Jvc29mdC5jb20lN0M0YTA5ZGY2Zjk2
YTY0NWMxMWE1NjA4ZDcxYTAyMjE1ZCU3QzcyZjk4OGJmODZmMTQxYWY5MWFiMmQ3Y2QwMTFkYjQ3
JTdDMSU3QzAlN0M2MzcwMDY0Njg3NjY0NjIyNTUmc2RhdGE9cjR6TE9VcEJ3ODA4cGdiJTJGdFpR
MTdzRHpoa2hBU2xmOGFSbmdwcTNzcE4wJTNEJnJlc2VydmVkPTA+IHwgUmVzZXQgUElOPGh0dHBz
Oi8vbmFtMDYuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUy
RiUyRm15c2V0dGluZ3MubHluYy5jb20lMkZwc3RuY29uZmVyZW5jaW5nJmRhdGE9MDIlN0MwMSU3
Q25lbGFkayU0MG1pY3Jvc29mdC5jb20lN0M0YTA5ZGY2Zjk2YTY0NWMxMWE1NjA4ZDcxYTAyMjE1
ZCU3QzcyZjk4OGJmODZmMTQxYWY5MWFiMmQ3Y2QwMTFkYjQ3JTdDMSU3QzAlN0M2MzcwMDY0Njg3
NjY0NjIyNTUmc2RhdGE9ZVFoT0NkMkxHelZxRERDOE9VJTJGZXpYdHp5Tng3RnVkYU5LY0QyRmMy
MUpVJTNEJnJlc2VydmVkPTA+IHwgTGVhcm4gbW9yZSBhYm91dCBUZWFtczxodHRwczovL2dvLm1p
Y3Jvc29mdC5jb20vZndsaW5rLz9saW5raWQ9ODU3MjUwPiB8IE1lZXRpbmcgb3B0aW9uczxodHRw
czovL25hbTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0El
MkYlMkZ0ZWFtcy5taWNyb3NvZnQuY29tJTJGbWVldGluZ09wdGlvbnMlMkYlM0Zvcmdhbml6ZXJJ
ZCUzRDFjMjljMmY3LWQzODYtNGM1YS1hM2JjLTBlZTEzYjQ4YmM2NSUyNnRlbmFudElkJTNENzJm
OTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3JTI2dGhyZWFkSWQlM0QxOV9tZWV0aW5n
X01EVTFORE0yWTJFdE9UWmtZeTAwWmpJNUxUa3pNRGN0TWpNeFpEWXlOemxoTmpReSU0MHRocmVh
ZC52MiUyNm1lc3NhZ2VJZCUzRDAlMjZsYW5ndWFnZSUzRGVuLVVTJmRhdGE9MDIlN0MwMSU3Q25l
bGFkayU0MG1pY3Jvc29mdC5jb20lN0M0YTA5ZGY2Zjk2YTY0NWMxMWE1NjA4ZDcxYTAyMjE1ZCU3
QzcyZjk4OGJmODZmMTQxYWY5MWFiMmQ3Y2QwMTFkYjQ3JTdDMSU3QzAlN0M2MzcwMDY0Njg3NjY0
NzIyNjQmc2RhdGE9bVdYbXhVdUpYS25GSlc5N2JoVFRoeXgxblJTeTJ2Y3U2ekVpTUowY0JYTSUz
RCZyZXNlcnZlZD0wPg0KSm9pbiB3aXRoIGEgdmlkZW8gY29uZmVyZW5jaW5nIGRldmljZQ0KODEz
ODc4ODk2QHQucGxjbS52YzxtYWlsdG86ODEzODc4ODk2QHQucGxjbS52Yz4gVlRDIENvbmZlcmVu
Y2UgSUQ6IDAxNzkyMDY4NA0KQWx0ZXJuYXRlIFZUQyBkaWFsaW5nIGluc3RydWN0aW9uczxodHRw
czovL25hbTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0El
MkYlMkZkaWFsaW4ucGxjbS52YyUyRnRlYW1zJTJGJTNGa2V5JTNEODEzODc4ODk2JTI2Y29uZiUz
RDAxNzkyMDY4NCZkYXRhPTAyJTdDMDElN0NuZWxhZGslNDBtaWNyb3NvZnQuY29tJTdDNGEwOWRm
NmY5NmE2NDVjMTFhNTYwOGQ3MWEwMjIxNWQlN0M3MmY5ODhiZjg2ZjE0MWFmOTFhYjJkN2NkMDEx
ZGI0NyU3QzElN0MwJTdDNjM3MDA2NDY4NzY2NDgyMjc0JnNkYXRhPVRFVXF0cyUyRm1QMWdUYkhC
MEhneGJKeWhRQVdZS1lyZ2xiJTJCMVhncEpOQUVVJTNEJnJlc2VydmVkPTA+DQoNCg==

--_000_BYAPR21MB1191314BF7B11D94C2B3A485C8A00BYAPR21MB1191namp_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dks_c_5601=
-1987">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Gulim;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:"Segoe UI Semibold";
	panose-1:2 11 7 2 4 2 4 2 2 3;}
@font-face
	{font-family:"\@Gulim";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
span.EmailStyle19
	{mso-style-type:personal;
	color:#2F5496;
	font-weight:normal;
	font-style:normal;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#002060;}
span.EmailStyle23
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#002060;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US">Hello.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US">This is reminder for today=A1=AFs
</span><span style=3D"color:#002060;mso-fareast-language:EN-US">OpenBMC pla=
tform telemetry workgroup meeting ( Tuesday 08/27 - &nbsp;9:30 PM PST)
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US">Neeraj<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openbmc &lt;openbmc-bounces&#43;neladk=
=3Dmicrosoft.com@lists.ozlabs.org&gt;
<b>On Behalf Of </b>Neeraj Ladkani<br>
<b>Sent:</b> Monday, August 5, 2019 5:07 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Cc:</b> Paul.Vancil@dell.com<br>
<b>Subject:</b> RE: Platform telemetry and health monitoring - PST AM <o:p>=
</o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US">Hello Everyone.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US">This is a reminder for tomorrow=A1=AFs OpenBMC platform telemetry work=
group meeting ( Tuesday 08/06 - &nbsp;9:30 AM PST)
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US">Neeraj<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal">-----Original Appointment-----<br>
<b>From:</b> Neeraj Ladkani <br>
<b>Sent:</b> Tuesday, June 4, 2019 12:09 AM<br>
<b>To:</b> Neeraj Ladkani; <a href=3D"mailto:openbmc@lists.ozlabs.org">open=
bmc@lists.ozlabs.org</a><br>
<b>Cc:</b> Joe P Mulholland; Luke Chen; Matt Chen/WYHQ/Wiwynn; Dong Wei; <a=
 href=3D"mailto:Jitendra_Kumar4@Dell.com">
Jitendra_Kumar4@Dell.com</a>; Reed B Frandsen; Michael Lim; Buddy Huang (<s=
pan lang=3D"KO" style=3D"font-family:&quot;Gulim&quot;,sans-serif">=FC=DC=
=F4=B8=FB=F8</span>); Tom Sand; Asmaa Mnebhi;
<a href=3D"mailto:Paul.Vancil@dell.com">Paul.Vancil@dell.com</a>; Tanous, E=
d; Christopher Bostic; James Morse; Vijay Khemka<br>
<b>Subject:</b> Platform telemetry and health monitoring - PST AM <br>
<b>When:</b> Tuesday, August 6, 2019 9:30 AM-10:30 AM (UTC-08:00) Pacific T=
ime (US &amp; Canada).<br>
<b>Where:</b> Microsoft Teams Meeting<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://nam06.safelinks.protection.outloo=
k.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2Fwiki%2FPlatform=
-telemetry-and-health-monitoring-Work-Group&amp;data=3D02%7C01%7Cneladk%40m=
icrosoft.com%7C4a09df6f96a645c11a5608d71a02215d%7C72f988bf86f141af91ab2d7cd=
011db47%7C1%7C0%7C637006468766452250&amp;sdata=3D6FmwoYfm%2FD893KxzEjzAXvgL=
m%2BUwbQVP9mziIyBCuQk%3D&amp;reserved=3D0">https://github.com/openbmc/openb=
mc/wiki/Platform-telemetry-and-health-monitoring-Work-Group</a><o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://teams.microsoft.com/l/meetup-join/=
19%3ameeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy%40thread.v2/0=
?context=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22O=
id%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d" target=3D"_blank"><s=
pan style=3D"font-size:13.5pt;font-family:&quot;Segoe UI Semibold&quot;,san=
s-serif;color:#6264A7">Join
 Microsoft Teams Meeting</span></a> <o:p></o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:&#43;1%20323-849-4874,,73572842# " tar=
get=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decoratio=
n:none">&#43;1 323-849-4874</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; United States, Los Angeles (Toll)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:(866)%20679-9995,,73572842# " target=
=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decoration:n=
one">(866) 679-9995</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; (Toll-free)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
</div>
<div style=3D"margin-top:7.5pt;margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424">Conference ID:
</span><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#252424">735 728 42#
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:.25in">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://nam06.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fdialin.teams.microsoft.com%2F8551f4c1-bea3-441a-8=
738-69aa517a91c5%3Fid%3D73572842&amp;data=3D02%7C01%7Cneladk%40microsoft.co=
m%7C4a09df6f96a645c11a5608d71a02215d%7C72f988bf86f141af91ab2d7cd011db47%7C1=
%7C0%7C637006468766462255&amp;sdata=3Dr4zLOUpBw808pgb%2FtZQ17sDzhkhASlf8aRn=
gpq3spN0%3D&amp;reserved=3D0" target=3D"_blank"><span style=3D"font-size:9.=
0pt;color:#6264A7;text-decoration:none">Local
 numbers</span></a> | <a href=3D"https://nam06.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fmysettings.lync.com%2Fpstnconferencing&amp;data=
=3D02%7C01%7Cneladk%40microsoft.com%7C4a09df6f96a645c11a5608d71a02215d%7C72=
f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637006468766462255&amp;sdata=3DeQh=
OCd2LGzVqDDC8OU%2FezXtzyNx7FudaNKcD2Fc21JU%3D&amp;reserved=3D0" target=3D"_=
blank">
<span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Reset PI=
N</span></a> |
<a href=3D"https://go.microsoft.com/fwlink/?linkid=3D857250" target=3D"_bla=
nk"><span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Lear=
n more about Teams</span></a> |
<a href=3D"https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fteams.microsoft.com%2FmeetingOptions%2F%3ForganizerId%3D1c29c2f7-d386-4=
c5a-a3bc-0ee13b48bc65%26tenantId%3D72f988bf-86f1-41af-91ab-2d7cd011db47%26t=
hreadId%3D19_meeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy%40thr=
ead.v2%26messageId%3D0%26language%3Den-US&amp;data=3D02%7C01%7Cneladk%40mic=
rosoft.com%7C4a09df6f96a645c11a5608d71a02215d%7C72f988bf86f141af91ab2d7cd01=
1db47%7C1%7C0%7C637006468766472264&amp;sdata=3DmWXmxUuJXKnFJW97bhTThyx1nRSy=
2vcu6zEiMJ0cBXM%3D&amp;reserved=3D0" target=3D"_blank">
<span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Meeting =
options</span></a>
<o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#252424">Join with a video conferencing devic=
e
<o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span class=3D"MsoHyperlink"><span style=3D"font-siz=
e:9.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#6264A7;text-deco=
ration:none"><a href=3D"mailto:813878896@t.plcm.vc">813878896@t.plcm.vc</a>=
</span></span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quo=
t;,sans-serif;color:#252424">
 VTC Conference ID: 017920684 <o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424"><a href=3D"https://nam06.safelinks.pr=
otection.outlook.com/?url=3Dhttps%3A%2F%2Fdialin.plcm.vc%2Fteams%2F%3Fkey%3=
D813878896%26conf%3D017920684&amp;data=3D02%7C01%7Cneladk%40microsoft.com%7=
C4a09df6f96a645c11a5608d71a02215d%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C=
0%7C637006468766482274&amp;sdata=3DTEUqts%2FmP1gTbHB0HgxbJyhQAWYKYrglb%2B1X=
gpJNAEU%3D&amp;reserved=3D0"><span style=3D"color:#6264A7;text-decoration:n=
one">Alternate
 VTC dialing instructions</span></a> <o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR21MB1191314BF7B11D94C2B3A485C8A00BYAPR21MB1191namp_--
