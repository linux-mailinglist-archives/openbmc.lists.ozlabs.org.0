Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E701B6416
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 20:55:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497RMR119pzDr6B
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 04:55:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1382a73f5b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=XrBh9xQ+; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=j+MspvD1; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497RLm2tBrzDr43
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 04:54:53 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NIUa2I023553; Thu, 23 Apr 2020 11:54:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=5hIaqljaoaDaW2a6IdbcBabV6brNckhy3U9ovBZWap0=;
 b=XrBh9xQ+a7mHQDSDNxjgztLmxncYSc2AEHblaQotWeuJlRLgIbi296KgDtAciDA/kn1P
 PDaGHE5j23yfkdI+7pLO92u/OHDLBPiIX5qYsEyveqYqmNBXJz8en3UgPGZEmPvBG48a
 WLVf7MF/NOAlyud9ZXdNR0TN+uie3pRe1IY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30keb112su-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Apr 2020 11:54:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 23 Apr 2020 11:54:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ow9qjC4I9jhNgqiYY5XuFNC5vaxsAJYb8+r9v6+0sfjnYhxlG0k9gvPTVTvGv+TD8HidDKLGp8eRDpYJHklWb+AH23oBmohXJEHuTWEEfX/Mcf4nfpKexE7lCVQA+eK5Sc7wROEBooV7Dg0USzLQDBz6Z9rHx8E1JdWTCGg9Fx1PEoK7OICtNKEyjGdnriPqev99o+hKW3rKuW0ZwDAT0VhUp4fTZpOaXsK4GjZxg4yBdN0psmJ3X675ADDzhGb5Si2ItVPSx/swLNZcz0c5gnygcXyZkaHmVro1nmqJx7rvVluISf4gFcDYohhC7eheyio0mItZoz+YWEAaOCHEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hIaqljaoaDaW2a6IdbcBabV6brNckhy3U9ovBZWap0=;
 b=hilPuIAE5o0/t8KOWx3QUOVn05eX69M0HcCm+PLt7vecpqH+1ItyNKWCY0xKlk1IXLZ91k0uFwppqhDcLVkqcSifovBVDRBmvKljFBxussFjpmXqqCIS8Rnl7E67S7rEzN0nDmnb7nXsmXs9YQpL5X6SoLIpzZGhnaM5GSzyXExLx2VpTyH4q8/lq82ipSCbY+eyuS29UtoOsMVzYFNHtHuY8YVDU+WEOXmxaLGUEv4AkJS4lHT/6eCMc+K872NSoy8tIh73odRhe6n7g8poT70DYtluOqioJifRNgl0eFN1yduc98W001s9w9cCbEA9q8Iyd94QjkDI6HxOpzwlyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hIaqljaoaDaW2a6IdbcBabV6brNckhy3U9ovBZWap0=;
 b=j+MspvD1sAmg02QFbH981Qe2VLicKEudzHDvKgBeOpUV39b2RjuDrqYjedXOfIjHRlT/qcJOXVT094TVskDEe7CdF2TQmfFJsU+hg3KvPhiOi7brpoTf4LNzjuVki510yiWJ9bTZ105FbphSGOBXk49MU6eMqHg+8J3kuJtVRjc=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2936.namprd15.prod.outlook.com (2603:10b6:a03:f9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Thu, 23 Apr
 2020 18:54:48 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.030; Thu, 23 Apr 2020
 18:54:48 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Geissler <geissonator@gmail.com>, Patrick Williams
 <patrickw3@fb.com>
Subject: dbus interface for SLED reset
Thread-Topic: dbus interface for SLED reset
Thread-Index: AQHWGaCpYCoC2aKp3U2vKa/m5xlWDA==
Date: Thu, 23 Apr 2020 18:54:47 +0000
Message-ID: <903F1195-A0B7-416A-8CD9-BDB1E30E0F2B@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:6774]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab90db3c-6fe8-4ed7-e7f9-08d7e7b7cbcc
x-ms-traffictypediagnostic: BYAPR15MB2936:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2936FB45D14552455BE57655DDD30@BYAPR15MB2936.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(376002)(39860400002)(136003)(366004)(396003)(36756003)(86362001)(6486002)(6512007)(6636002)(71200400001)(8936002)(110136005)(9326002)(316002)(81156014)(8676002)(6506007)(478600001)(5660300002)(33656002)(966005)(64756008)(66446008)(66476007)(66556008)(66946007)(4744005)(2616005)(4326008)(186003)(91956017)(2906002)(76116006);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7aw4F+Paffu50b6FiiXLzv9FEBW5T4/YBBTKfbto8gY4NcNH3D8j+IOAPVzENq6kN8Nf2V5+qWnaNZp6N1WS95sTI9WEJ5IBX964JLQOEzM0/HSY1uBdsKWJkRD3lQNPifODDN1akXZPlaifDB0R83NpLE6uu2QDyXQxe4DX/HRzRp26xKkaLuCj5ydy9CcNtuR8FehCX2zP/2vbJnNVVFsy3B/AfW/Azh33IGmPDES1zc5d9khqmaj4+FYVfssZVBYlcn9QixWk/NgVl9ZLcbdQtcGry2DMmxwDT6aAQcBG3hlMR3Eu4f7q6ly0nriVoPEd9LThaYsKEnIIRdjDv1lqi4w9D+IS6+PifnY1wlJowF/slUuKH8ZVTWy0DL9QICqn6yBmZf6dqClxgXFzVA+fqJniG3sUJ2KbA60dpHKhNEkzmNlqyAX+2H53FlmxzS1zQYQLr09Wbnrzpq4aMj52BKTpUOtiaQ61ROn5fjPzuClDTIslXbFmqT+8IClnZkUGfj7oCWUjY4st2cKnHg==
x-ms-exchange-antispam-messagedata: Gxbc9Fn8Dg0vnPlYx41gu7ymBaA4O5IykYBvtscsm1Og+MZIF/c8cVFEe4KBCb/syDA3BTHvZqF68+14Xd87jtnGWZdE2gHjnn9xznfQJZmablwHlu8N+keuGeD0BnLJjXCbvQ6zWkRIqgB60oga0Dg3fV0+XjL+SZ2Q/U47bC1NvUQ01LJMOGozV2fPoK/Q
Content-Type: multipart/alternative;
 boundary="_000_903F1195A0B7416A8CD9BDB1E30E0F2Bfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ab90db3c-6fe8-4ed7-e7f9-08d7e7b7cbcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 18:54:47.9669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n2Ya2zLU2JtsEUcQI9LitBMRV43YhGr1A7Ity4g9KvahioatX3F4+4IXEYzoenvSUq0jbfea8XoFDaI+VeHaQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2936
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_13:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004230144
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_903F1195A0B7416A8CD9BDB1E30E0F2Bfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5kcmV3LA0KQXMgZGlzY3Vzc2VkIHRoaXMgaW4gcGF0Y2ggcmV2aWV3IGh0dHBzOi8vZ2Vy
cml0Lm9wZW5ibWMtcHJvamVjdC54eXovIy9jL29wZW5ibWMvcGhvc3Bob3ItZGJ1cy1pbnRlcmZh
Y2VzLysvMzEzMTkvLCBJIGhhdmUgdGhvdWdodCBvZiAyIGFwcHJvYWNoIHRvIGhhbmRsZSB0aGlz
IGludGVyZmFjZS4NCg0KDQogIDEuICBBcyBpbmNsdWRlZCBpbiBwYXRjaCBjcmVhdGUgYSBuZXcg
bWV0aG9kIFNsZWQgUmVzZXQgaW4geHl6L29wZW5ibWNfcHJvamVjdC9DaGFzc2lzL0NvbnRyb2wv
UG93ZXIuaW50ZXJmYWNlLnlhbWwuIHdoaWNoIGNhbiBiZSBpbnZva2VkIGJ5IHVzZXIgZm9yIHNs
ZWQgcmVzZXQuDQogIDIuICBBcyBzdWdnZXN0ZWQgYnkgbWFueSByZXZpZXdlciB0byBoYXZlIGEg
bmV3IGNoYXNzaXMgaW5zdGFuY2UgaW4geHl6L29wZW5ibWNfcHJvamVjdC9TdGF0ZS9DaGFzc2lz
LmludGVyZmFjZS55YW1sIGFuZCB1c2UgcG93ZXJDeWNsZSBwcm9wZXJ0eSBmb3IgU2xlZCByZXNl
dC4gQXMgY2hhc3NpcyBhcmUgbmFtZWQgYXMgY2hhc3NpczAtTi4gV2hhdCBzaG91bGQgYmUgYXBw
cm9wcmlhdGUgbmFtZSB0byBiZSB1c2VkIGZvciB0aGlzIGluc3RhbmNlIGlmIHdlIGNob29zZSB0
aGlzIG9wdGlvbi4gQ2FuIGl0IGJlIGNoYXNzaXMtc2VydmVyIG9yIEkgYW0gbm90IGdldHRpbmcg
cHJvcGVyIG5hbWUsIHBsZWFzZSBzdWdnZXN0Lg0KDQpSZWdhcmRzDQotVmlqYXkNCg==

--_000_903F1195A0B7416A8CD9BDB1E30E0F2Bfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <2099AB8FC22A78448DD8F2331958F599@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQpwLk1zb0xpc3RQYXJhZ3JhcGgsIGxpLk1zb0xpc3RQYXJhZ3JhcGgsIGRpdi5Nc29MaXN0UGFy
YWdyYXBoDQoJe21zby1zdHlsZS1wcmlvcml0eTozNDsNCgltYXJnaW4tdG9wOjBpbjsNCgltYXJn
aW4tcmlnaHQ6MGluOw0KCW1hcmdpbi1ib3R0b206MGluOw0KCW1hcmdpbi1sZWZ0Oi41aW47DQoJ
bWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5
cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsN
Cgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4
cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdv
cmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4w
aW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQovKiBM
aXN0IERlZmluaXRpb25zICovDQpAbGlzdCBsMA0KCXttc28tbGlzdC1pZDoxMzE5NjQ5NTk2Ow0K
CW1zby1saXN0LXR5cGU6aHlicmlkOw0KCW1zby1saXN0LXRlbXBsYXRlLWlkczotMTYwOTk1Mjkw
NiA2NzY5ODcwMyA2NzY5ODcxMyA2NzY5ODcxNSA2NzY5ODcwMyA2NzY5ODcxMyA2NzY5ODcxNSA2
NzY5ODcwMyA2NzY5ODcxMyA2NzY5ODcxNTt9DQpAbGlzdCBsMDpsZXZlbDENCgl7bXNvLWxldmVs
LXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQt
aW5kZW50Oi0uMjVpbjt9DQpAbGlzdCBsMDpsZXZlbDINCgl7bXNvLWxldmVsLW51bWJlci1mb3Jt
YXQ6YWxwaGEtbG93ZXI7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51
bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpAbGlzdCBsMDpsZXZl
bDMNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6cm9tYW4tbG93ZXI7DQoJbXNvLWxldmVsLXRh
Yi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpyaWdodDsNCgl0ZXh0LWlu
ZGVudDotOS4wcHQ7fQ0KQGxpc3QgbDA6bGV2ZWw0DQoJe21zby1sZXZlbC10YWItc3RvcDpub25l
Ow0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47
fQ0KQGxpc3QgbDA6bGV2ZWw1DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OmFscGhhLWxvd2Vy
Ow0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246
bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWw2DQoJe21zby1sZXZl
bC1udW1iZXItZm9ybWF0OnJvbWFuLWxvd2VyOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0K
CW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246cmlnaHQ7DQoJdGV4dC1pbmRlbnQ6LTkuMHB0O30N
CkBsaXN0IGwwOmxldmVsNw0KCXttc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwt
bnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30NCkBsaXN0IGwwOmxl
dmVsOA0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDphbHBoYS1sb3dlcjsNCgltc28tbGV2ZWwt
dGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1p
bmRlbnQ6LS4yNWluO30NCkBsaXN0IGwwOmxldmVsOQ0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1h
dDpyb21hbi1sb3dlcjsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVt
YmVyLXBvc2l0aW9uOnJpZ2h0Ow0KCXRleHQtaW5kZW50Oi05LjBwdDt9DQpvbA0KCXttYXJnaW4t
Ym90dG9tOjBpbjt9DQp1bA0KCXttYXJnaW4tYm90dG9tOjBpbjt9DQotLT48L3N0eWxlPg0KPC9o
ZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4N
CjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdCI+SGkgQW5kcmV3LCA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+QXMg
ZGlzY3Vzc2VkIHRoaXMgaW4gcGF0Y2ggcmV2aWV3DQo8L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly9n
ZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8jL2Mvb3BlbmJtYy9waG9zcGhvci1kYnVzLWludGVy
ZmFjZXMvJiM0MzsvMzEzMTkvIj5odHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6LyMv
Yy9vcGVuYm1jL3Bob3NwaG9yLWRidXMtaW50ZXJmYWNlcy8mIzQzOy8zMTMxOS88L2E+LCBJIGhh
dmUgdGhvdWdodCBvZiAyIGFwcHJvYWNoIHRvIGhhbmRsZSB0aGlzIGludGVyZmFjZS48bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPG9s
IHN0eWxlPSJtYXJnaW4tdG9wOjBpbiIgc3RhcnQ9IjEiIHR5cGU9IjEiPg0KPGxpIGNsYXNzPSJN
c29MaXN0UGFyYWdyYXBoIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MGluO21zby1saXN0OmwwIGxldmVs
MSBsZm8xIj5BcyBpbmNsdWRlZCBpbiBwYXRjaCBjcmVhdGUgYSBuZXcgbWV0aG9kIFNsZWQgUmVz
ZXQgaW4geHl6L29wZW5ibWNfcHJvamVjdC9DaGFzc2lzL0NvbnRyb2wvUG93ZXIuaW50ZXJmYWNl
LnlhbWwuIHdoaWNoIGNhbiBiZSBpbnZva2VkIGJ5IHVzZXIgZm9yIHNsZWQgcmVzZXQuPG86cD48
L286cD48L2xpPjxsaSBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaCIgc3R5bGU9Im1hcmdpbi1sZWZ0
OjBpbjttc28tbGlzdDpsMCBsZXZlbDEgbGZvMSI+QXMgc3VnZ2VzdGVkIGJ5IG1hbnkgcmV2aWV3
ZXIgdG8gaGF2ZSBhIG5ldyBjaGFzc2lzIGluc3RhbmNlIGluIHh5ei9vcGVuYm1jX3Byb2plY3Qv
U3RhdGUvQ2hhc3Npcy5pbnRlcmZhY2UueWFtbCBhbmQgdXNlIHBvd2VyQ3ljbGUgcHJvcGVydHkg
Zm9yIFNsZWQgcmVzZXQuIEFzIGNoYXNzaXMgYXJlIG5hbWVkIGFzDQogY2hhc3NpczAtTi4gV2hh
dCBzaG91bGQgYmUgYXBwcm9wcmlhdGUgbmFtZSB0byBiZSB1c2VkIGZvciB0aGlzIGluc3RhbmNl
IGlmIHdlIGNob29zZSB0aGlzIG9wdGlvbi4gQ2FuIGl0IGJlIGNoYXNzaXMtc2VydmVyIG9yIEkg
YW0gbm90IGdldHRpbmcgcHJvcGVyIG5hbWUsIHBsZWFzZSBzdWdnZXN0LjxvOnA+PC9vOnA+PC9s
aT48L29sPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5SZWdhcmRzPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj4tVmlqYXkgJm5ic3A7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRt
bD4NCg==

--_000_903F1195A0B7416A8CD9BDB1E30E0F2Bfbcom_--
