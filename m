Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A228ED1DED
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 03:17:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pY9M59d2zDqcN
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 12:17:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=51862215bb=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="UjtLTjT7"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="FhNB9oey"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pY8W4xKPzDqZj
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 12:16:54 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x9A1F21g015196;
 Wed, 9 Oct 2019 18:16:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=yfVGPW7jmyXQ5LdfzmXr9pbw8RMxohETO+c/7FcUH6g=;
 b=UjtLTjT7KHOg5R/HPgHC5GQx2yu0CSUk7TTHoIA9iovXJcT8wG2HkLsXT9sq755Q64yl
 NQM/1CI2rWj/pzV7W77IWySqY4TuUeFmQtTVfFpG0yUvkb2wZvfvJyn4KgTnvFdrqlBD
 srOJvVk+/94ksYkLuuUE71b6iRvMdAtFETE= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2vhgwp2v6s-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2019 18:16:46 -0700
Received: from prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 9 Oct 2019 18:16:44 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 9 Oct 2019 18:16:44 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 9 Oct 2019 18:16:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CC141obiniF07pfjql9FDU4ceGCmCWiwXKZYfTO4Ix/qFHr+9NTSZtLnb5k7gEghpr30EXBy2rTHdgWctg57SCVNPZSpYXzLxw2oCUCcl84TIXrQufAG9I7bOqKu9jPHXxIH0uUWaZrmWsXq/ilRzJFPLB13x6s+PgNhI/bQo90lPqkHnnQelagY4j2h2cUhK1WU4RyJksU8wM7Ypa45P9Cxi9M1xB/3WH1XHnNUOONXUOhf4mfcjPY9dHtCTk+RA2C5BjS97cYglaxq/apPHOtRYtREF5AMr2XtBBBLUGSYgcaWFRXF9X8VoGVOZzaXnALMm247EkMEDk5MdIn4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfVGPW7jmyXQ5LdfzmXr9pbw8RMxohETO+c/7FcUH6g=;
 b=UYpH+cYEatPdB3hN9HutyxGiZ+OiL6374hS1ckHdb/S1nj7nIKbMvW62fMlajIG2/7zWalD/xVEEt9nuR8nU4lFAbIoLQHtu63nX/s5lArjls6azeTbCcjtsSs8pLNVwX5Roe4pYqQ+1XpbAEzDPSfRAuCAiCs0gJDHQ9Jios0kG+hZDDoh9bUunXYXWBKbxoVUmk/NYdkG9/YWWpPxPjcCKBf9a88dU4Dd2h4zhljDjsXYu7vWzn0efMjeUm+vwSZIiDvxOBZP9YftB6O2UTI6gYE82tFZv2mgtnAb6HrQWKJex08FyrItO9M3S0OJkkuSV34ODC085DO9kwK/Jvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfVGPW7jmyXQ5LdfzmXr9pbw8RMxohETO+c/7FcUH6g=;
 b=FhNB9oeyIjFuBmOBkd1qImYdK94eIy2bCpgV5kOxquko38Y6U3DLGBMwgx31yXon2BY4HejNHuRqkkGcvHuBfOaVlsBHbuBF5sktB+5t83JkbA9gYHQ45g3wfXHxPDpIfZS/hV8A3RpiUuYUNKhE+CKQB8MA+Utj1U7cAQkUIfE=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3524.namprd15.prod.outlook.com (52.133.252.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 01:16:44 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 01:16:44 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: speed-bmc-misc driver
Thread-Topic: speed-bmc-misc driver
Thread-Index: AQHVfsmnNsQbcA9jQ0Ge8qC4MJbYC6dS6UoA//+0ioA=
Date: Thu, 10 Oct 2019 01:16:43 +0000
Message-ID: <11B7B23D-B689-4B0B-A177-E6E4891C923A@fb.com>
References: <81DE4370-D135-48EE-A8FC-B079C4CE3648@fb.com>
 <06d793dc-a0f0-4917-a0c7-135767f6c19b@www.fastmail.com>
In-Reply-To: <06d793dc-a0f0-4917-a0c7-135767f6c19b@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:1fb8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05f1895b-a825-41aa-8bec-08d74d1f836b
x-ms-traffictypediagnostic: BY5PR15MB3524:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BY5PR15MB3524A949DDCDE7B14DF473CDDD940@BY5PR15MB3524.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(346002)(136003)(376002)(396003)(189003)(199004)(66556008)(99286004)(478600001)(71190400001)(81156014)(316002)(33656002)(71200400001)(8676002)(5660300002)(2906002)(66446008)(81166006)(256004)(64756008)(6506007)(6486002)(6436002)(8936002)(91956017)(6306002)(186003)(66476007)(76116006)(6512007)(102836004)(66946007)(6916009)(25786009)(86362001)(2616005)(4326008)(76176011)(966005)(6116002)(6246003)(3480700005)(486006)(14454004)(229853002)(46003)(305945005)(446003)(7736002)(11346002)(476003)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3524;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nJUBnRqxGSGbH8/IzpclVu5deJxhXYTaL7NWE5538tb5VyS0zyBzGeQ0Fz8i1xP9wAGhbW3+pK09UelcNI3fj+2YK1/nP+QsF8ySVjUCaV7xkd/AmJG6hy8HtW+JGQjvnaao5zT0zjjU+cG8aUzXbcFgaiTSBx0r7MEYsKBtn/m9sYH4k0j9Riply61gM9+5x36YboMEo0KO5O4x6jvyqPL+FJMGO3NU264wqTIgQ8EZfmYrNrGWVD0KHImz60ifE+8DAiuD/Cw9hNIDcS1ZhwW0bBz7R5hmJTqlpC+rm2+GwdEeFiVTAi+wkVKGOXRO7dSYAYTvaH2XJstfg7PMFOtSgOuaZq13NKNed2W7BChtukRiLRwAOg87j3qNp33nfuf0GOaN1LSUVi//rQA9r6xxXXB3u43tCxZX5U9bFVlBf/ZvqRWv57Xi7EldBC+clE6RM5XcmUmhFHVah9o9JA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C12A7912A7FEA47BDDCC48F3EADC3A0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f1895b-a825-41aa-8bec-08d74d1f836b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 01:16:43.9053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQW9A8GFfHkN5cG6PXaLH9CTEbheK8Tov4qYMWotxQrPr/x4070RU8iTn0pdqB3HrZMmEmInLnnsIZkqtBM/BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3524
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_11:2019-10-08,2019-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1910100009
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

SGkgQW5kcmV3LA0KVGhhbmtzIGZvciBkZXRhaWxlZCBleHBsYW5hdGlvbi4NCg0KUmVnYXJkcw0K
LVZpamF5DQoNCg0K77u/T24gMTAvOS8xOSwgMzo0NiBQTSwgIkFuZHJldyBKZWZmZXJ5IiA8YW5k
cmV3QGFqLmlkLmF1PiB3cm90ZToNCg0KICAgIEhpIFZpamF5LA0KICAgIA0KICAgIE9uIFRodSwg
MTAgT2N0IDIwMTksIGF0IDA0OjE3LCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgPiAgDQogICAg
PiBIaSBBbmRyZXcsDQogICAgPiANCiAgICA+IEkgc2F3IHRoaXMgZHJpdmVyIGluIExGIGFzcGVl
ZCBMaW51eCANCiAgICANCiAgICBXaGF0IGRvIHlvdSBtZWFuIGJ5ICJMRiBhc3BlZWQgTGludXgi
PyBUaGUgb25seSBwbGFjZSB0aGlzIGRyaXZlciBsaXZlcyBpcw0KICAgIGluIHRoZSBPcGVuQk1D
IGtlcm5lbCB0cmVlIChvcGVuYm1jL2xpbnV4IG9uIGdpdGh1YikuDQogICAgDQogICAgPiBhbmQg
d2FzIHdvbmRlcmluZyBob3cgdG8gdXNlLiBDYW4gDQogICAgPiB5b3UgcGxlYXNlIHN1Z2dlc3Qg
c29tZSB1c2FnZSBleGFtcGxlIGxpa2UgZGV2aWNlIHRyZWUgZW50cnkgYXMgd2VsbCBhcyANCiAg
ICA+IHN5c2ZzIGludGVyZmFjZS4NCiAgICANCiAgICBIb25lc3RseSwgSSB3b3VsZG4ndCByZWNv
bW1lbmQgdXNpbmcgKHlldCkuIEl0IGNhbid0IGJlIHVwc3RyZWFtZWQgaW4gaXRzDQogICAgY3Vy
cmVudCBmb3JtIChJJ3ZlIHRyaWVkKSwgYW5kIHNvIHVzaW5nIGl0IGFzIGlzIGNvbWVzIHdpdGgg
dXNlcnNwYWNlLWJyZWFraW5nDQogICAgY2hhbmdlcyBpbiB0aGUgZnV0dXJlLiBJIHJlc2VydmUg
dGhlIHJpZ2h0IHRvIGJyZWFrIHlvdXIgbWFjaGluZXMgaWYgeW91IGRvDQogICAgbWFrZSB1c2Ug
b2YgaXQgd2hlbiBJIGdldCB0aGUgdGltZSB0byByZXdvcmsgdGhlIHBhdGNoZXMuDQogICAgDQog
ICAgSGF2aW5nIHNhaWQgdGhhdCwgaXRzIHB1cnBvc2UgaXMgdG8gZXhwb3NlIGFyYml0cmFyeSBm
aWVsZHMgaW4gYXJiaXRyYXJ5IHJlZ2lzdGVycw0KICAgIG9uIHRoZSBCTUMgdG8gdXNlcnNwYWNl
IHZpYSBzeXNmcy4gVGhpcyBpcyB1c2VmdWwgd2hlbiB0aGUgZmllbGQncyB2YWx1ZSBpcw0KICAg
IGVudGlyZWx5IGRldGVybWluZWQgYnkgdXNlcnNwYWNlIHBvbGljeSBhbmQgdGhlcmUncyBubyBu
ZWVkIGZvciBhZGRpdGlvbmFsDQogICAga2VybmVsIGluZnJhc3RydWN0dXJlIGFyb3VuZCB0aGUg
Y29uZmlndXJhdGlvbi4NCiAgICANCiAgICBPcmlnaW5hbGx5IHRoaXMgd2FzIGludGVuZGVkIHRv
IGV4cG9zZSB0byB1c2Vyc3BhY2UgdGhlIGJpdHMgdGhhdCBjb250cm9sIHRoZQ0KICAgIHN0YXRl
IG9mIHRoZSBBU1BFRUQgaGFyZHdhcmUgYmFja2Rvb3JzLCBidXQgd2UgY2hhbmdlZCB0YWNrIG9u
IHRoZQ0KICAgIHNvbHV0aW9uIHRvIENWRS0yMDE5LTYyNjAgYmVmb3JlIHRoZSBibWMtbWlzYyBp
ZGVhIGdvdCB2ZXJ5IGZhci4NCiAgICANCiAgICBIb3dldmVyIHlvdSBjYW4gZmluZCBzb21lIHNs
aWdodGx5IGFidXNpdmUgdXNlcyBpZiB5b3Ugc2VhcmNoIHRoZSBkdHNpczoNCiAgICANCiAgICBo
dHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9saW51eC9ibG9iL2Rldi01LjMvYXJjaC9hcm0vYm9v
dC9kdHMvYXNwZWVkLWc1LmR0c2kjTDE2ODINCiAgICANCiAgICBJbiB0aGF0IGluc3RhbmNlIHdl
J3JlIGV4cG9zaW5nIHRoZSBTdXBlcklPIHNjcmF0Y2ggcmVnaXN0ZXJzIHRvIHVzZXJzcGFjZQ0K
ICAgIHVzaW5nIHRoaXMgbWVjaGFuaXNtLiBUaGUgYXR0cmlidXRlcyBjYW4gYmUgZm91bmQgaW4g
c3lzZnMgYXNzb2NpYXRlZCB3aXRoDQogICAgdGhlIGRldmljZXRyZWUgbm9kZS4gSSBkaWQgaGF2
ZSBhIGhhY2sgdG8gYWRkIGEgc3lzZnMgY2xhc3MgZm9yIHRoZW0sIGJ1dCB0aGF0DQogICAgd2Fz
IGV2ZW4gbW9yZSBjb250cm92ZXJzaWFsIHRoYW4gdGhlIGdlbmVyYWwgY29uY2VwdCBvZiB0aGUg
ImRyaXZlciIgc28NCiAgICB5b3UncmUgZ29pbmcgdG8gaGF2ZSB0byBjb3BlIHdpdGggY2hhbmdl
cyB0byB0aGUgZGV2aWNldHJlZSBwb3RlbnRpYWxseQ0KICAgIGJyZWFraW5nIHVzZXJzcGFjZSB1
bmxlc3MgeW91J3JlIHdpbGxpbmcgdG8gcmV3b3JrIHRoZSBwYXRjaGVzIHlvdXJzZWxmLg0KICAg
IA0KICAgIEhvcGUgdGhhdCBoZWxwcy4NCiAgICANCiAgICBBbmRyZXcNCiAgICANCg0K
