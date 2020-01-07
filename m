Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC62131CD8
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 01:46:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sDGH3mVXzDqS9
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 11:46:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8275cdec92=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ObYpsBIE"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="GwdRmY3S"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sDFb68tXzDqJL
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 11:45:54 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0070f4nk023291; Mon, 6 Jan 2020 16:45:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=qyAIG/QBPZmbvfI8GaI12EXu2bz66a/2g5caKB6niZE=;
 b=ObYpsBIEFlZlrSPhUl9K5IJzyVZjbvwAqbg+rOSfqHZKyix8JXOcIAXsBg3k44umsFt8
 Mg657+lahEHw9YzA4kdYZkJZfo/xR34Naeu3SErT80tMK33x1PQkjpBZqRrT334D15+2
 TSymYoUxpVnlKfeKOPcl63HVdpmqVlpEnLs= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2xcc3k92hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 16:45:50 -0800
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 6 Jan 2020 16:45:48 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 6 Jan 2020 16:45:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTDGvwzchq0OVg/2i1fNpVBn3jSLd1NyDCV8+6Wp/nz7d786R69tiCe2tO9w4X4o9o0TdsgYRpkMNgeIio2H5wWYymrVKLRQh1PZj56tXrjBgLvUdOFl8RhzmOm7SsqdXGCurJHx6YxL/+LvFfHNxaxNpDBc6lJ3iM3Ms5IOOd3aksOI0sqyVJtppiLODoy0HLd/b96xwzoD5DdVAg+eJvqLhmmKG4TDietFDbL8bIrJVXNaXQGQn+SKpBqb2+eHdF6CR9fFzCPObtwbgL77Pthy9xTsa7Tyitm3k1ZjCEY8oF6NgvwUt1jV7Q+uJiRd8DNC+NhhsAwk/f2FkX09+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyAIG/QBPZmbvfI8GaI12EXu2bz66a/2g5caKB6niZE=;
 b=m8Yw9xORGAzR4CMtP3iWGl+zXgM47d5pCK8ekSXb95NHErTvX9urSVkwIbHxPLMq+kb8nxPW9mTYCRLJSWrfdVJZ5lwknN1X9DF9jADlSapLDiu+NGYxrwu3d3MiveAM7SeV1rDbRXoyikVL8uQSr4RQOvc4gPdWZJgnLp8ZDH3K8JuPgFJjVQYRT5BdFXtxmBNY1qCaXoTRpuw7CMjbSn+9zG9MPbOTjvhQRSkQ+Z98Ag5T0iYJmKnO/BDPRSHiyLIupXeDJEDeg2ip2XGlI/zy8RM2eJFzwfIK2An7L680PIsTObMS4TvgI4RotcoNZ1yid4mlV+0W6FQxT8RQcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyAIG/QBPZmbvfI8GaI12EXu2bz66a/2g5caKB6niZE=;
 b=GwdRmY3S2UPdZ688/G/a7YnQ2KiYZZC4f7DcNucKUMBLREDuPndKSkbkGkfkobv4qlZUoZpbcpqTTp/nl7bTREMyYC8+AfEb7juhsMYay58EZouewefDAQ9rHiiEjQQKyCXQTV3fu9JLNg3e/m4yup4VKsV17tnPpPpEcr+iv6I=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1840.namprd15.prod.outlook.com (10.174.99.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12; Tue, 7 Jan 2020 00:45:46 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2602.015; Tue, 7 Jan 2020
 00:45:46 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: webui not working for me
Thread-Topic: webui not working for me
Thread-Index: AQHVwp+iARalw1g7X0WpTmm06cK1kqfdIe6AgABhfACAANBLAP//gSIAgACHeID//3tIAIAAiQyA//97mIA=
Date: Tue, 7 Jan 2020 00:45:46 +0000
Message-ID: <F844EB41-C241-4418-99F8-52E75CF3ED2C@fb.com>
References: <41D87A5C-8EBF-4DA2-9E1E-A37D51A4CA72@fb.com>
 <a009631a-efec-2e14-6871-b8618ffb4b96@linux.vnet.ibm.com>
 <E008BED2-5B56-4946-BD37-1F6928AE60BE@fb.com>
 <1bec6eda-be49-e9b7-2ba3-f1ec5d4d89e8@linux.vnet.ibm.com>
 <FF4567F9-FA73-4076-AD9E-67C0237F4521@fb.com>
 <e100a34f-0335-d557-7e83-ebae9338b02f@linux.vnet.ibm.com>
 <D4297867-C2F9-448D-887E-032C1EF5B871@fb.com>
 <99c35ab3-0152-afcc-72c1-e359b3569e9a@linux.vnet.ibm.com>
In-Reply-To: <99c35ab3-0152-afcc-72c1-e359b3569e9a@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:889a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c90b786-8162-4c1b-7b15-08d7930aef04
x-ms-traffictypediagnostic: MWHPR15MB1840:
x-microsoft-antispam-prvs: <MWHPR15MB18404412F4764D3A4799E473DD3F0@MWHPR15MB1840.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(39860400002)(366004)(396003)(136003)(189003)(199004)(110136005)(316002)(2616005)(6512007)(86362001)(4744005)(6506007)(2906002)(33656002)(186003)(5660300002)(53546011)(966005)(478600001)(81156014)(81166006)(8936002)(66476007)(8676002)(66556008)(66946007)(64756008)(66446008)(76116006)(71200400001)(6486002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1840;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DOyREA8g0YipHeAT6HeBbE1Gr+Lpblp6ym/vwM5Pkw3vleI5YiW2LxWzpw0Ok1avgUsjB33e9Rj87N56HHoO1Ez/ZfE1H3Yc+mi+2bGomIJ1V7RJMUK23BUaU411ND7x9dVAgTeUc9ljUXrqbXD6yiWFQA6wdXq3MmB8GcH2pD+UyISk0bCXrL1RUeKrLl9/XYnIa57rRZEwqoUQKG5H3ajJsgQNYaxH3ta/OGq+ALduT9r+C8NHU5D/S6g0FtbFSQSPvRzIHPuaqJvTMtL2wVuw66sLtpea9WdzhOyOukzp7vL+2Ot3oMoOIjWEpYIITASlNzRaJ7Xca2C4cxhkrHFRn0jPl71bYDt1H4NJ0NZ52MPYL4A0eaoFUnzPvQIDcHzmNb2REm65RezIatjzmLqncmV/JvvNZmq1AoN2B3EN3f4qY7kENcz5TVG1uhfszPVFjtQp7wn6YZDkadqqSYJSzTvVYJa5qShGX5vp+mU=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_F844EB41C241441899F852E75CF3ED2Cfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c90b786-8162-4c1b-7b15-08d7930aef04
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 00:45:46.3689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l1IVv9Z1ZC/iTd2MMnOuorQoygnL/+LyBYR87QYKyBJhNEzcQpCsiXGyX7Rx1+dozPDxxEe4xT/BnyoOQBq4JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1840
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_08:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070002
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_F844EB41C241441899F852E75CF3ED2Cfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkZyb206IEd1bm5hciBNaWxscyA8Z21pbGxzQGxpbnV4LnZuZXQuaWJtLmNvbT4NCkRhdGU6
IE1vbmRheSwgSmFudWFyeSA2LCAyMDIwIGF0IDQ6NDAgUE0NClRvOiBWaWpheSBLaGVta2EgPHZp
amF5a2hlbWthQGZiLmNvbT4sICJvcGVuYm1jQGxpc3RzLm96bGFicy5vcmciIDxvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmc+DQpTdWJqZWN0OiBSZTogd2VidWkgbm90IHdvcmtpbmcgZm9yIG1lDQoN
Cg0KDQpPbiAxLzYvMjAyMCA2OjI5IFBNLCBWaWpheSBLaGVta2Egd3JvdGU6DQoNCkl0IHNheXMg
b24gcGFnZSDigJx0aGVyZSBhcmUgbm8gc2Vuc29ycyBhdmFpbGFibGXigJ0NCg0KDQpBIGN1cmwg
Y2FsbCB0byAveHl6L29wZW5ibWNfcHJvamVjdC9zZW5zb3JzL2VudW1lcmF0ZSByZXR1cm5zIGFs
bCB0aGUgc2Vuc29ycyBjb3JyZWN0bHkgPw0KDQpJIGhhdmUgbm90IHVzZWQgYW55IGN1cmwgY29t
bWFuZCBoZXJlLiBQbGVhc2UgbGV0IG1lIGtub3cgd2hhdCBjdXJsIGNvbW1hbmQgdG8gdXNlLiBC
dXQgaW50ZWwgaXMgdXNpbmcgcmVkZmlzaCBtZXRob2QgdG8gZ2V0IHRoZXNlIGRhdGEuDQoNCmh0
dHBzOi8vZ2l0aHViLmNvbS9JbnRlbC1CTUMvcGhvc3Bob3Itd2VidWkvYmxvYi9lMzRmNDZjMTkx
YTRjOTkzNjA4YWM2NGE4Njc5MjBmYjY0MGU4MTMzL2FwcC9jb21tb24vc2VydmljZXMvYXBpLXV0
aWxzLmpzI0w5MzINCg0KDQpJZiBzbywgcHJvYmFibHkgd2lsbCBuZWVkIHRvIGFkZCBzb21lIGNv
bnNvbGUubG9nKClzIHRvIHRoYXQgZnVuY3Rpb24NCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1j
L3Bob3NwaG9yLXdlYnVpL2Jsb2IvZjcwZjQyNTUzNjE1OTcyMTYzYjM2YzliNGQ3N2JlMDdlNDM5
OTEyMi9hcHAvY29tbW9uL3NlcnZpY2VzL2FwaS11dGlscy5qcyNMOTEyDQoNCg==

--_000_F844EB41C241441899F852E75CF3ED2Cfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <5E1F26238B8E144496671367AFFFE00E@namprd15.prod.outlook.com>
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
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5Ok1lbmxvOw0K
CXBhbm9zZS0xOjIgMTEgNiA5IDMgOCA0IDIgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25zICov
DQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowaW47
DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXtt
c28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjNDMTsNCgl0ZXh0LWRlY29yYXRpb246
dW5kZXJsaW5lO30NCmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBlcmxpbmtGb2xsb3dlZA0KCXttc28t
c3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Izk1NEY3MjsNCgl0ZXh0LWRlY29yYXRpb246dW5k
ZXJsaW5lO30NCnAuTXNvTGlzdFBhcmFncmFwaCwgbGkuTXNvTGlzdFBhcmFncmFwaCwgZGl2Lk1z
b0xpc3RQYXJhZ3JhcGgNCgl7bXNvLXN0eWxlLXByaW9yaXR5OjM0Ow0KCW1hcmdpbi10b3A6MGlu
Ow0KCW1hcmdpbi1yaWdodDowaW47DQoJbWFyZ2luLWJvdHRvbTowaW47DQoJbWFyZ2luLWxlZnQ6
LjVpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250
LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpwLm1zb25vcm1hbDAsIGxpLm1zb25vcm1h
bDAsIGRpdi5tc29ub3JtYWwwDQoJe21zby1zdHlsZS1uYW1lOm1zb25vcm1hbDsNCgltc28tbWFy
Z2luLXRvcC1hbHQ6YXV0bzsNCgltYXJnaW4tcmlnaHQ6MGluOw0KCW1zby1tYXJnaW4tYm90dG9t
LWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0OjBpbjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQt
ZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnAucDEsIGxpLnAxLCBkaXYucDENCgl7bXNv
LXN0eWxlLW5hbWU6cDE7DQoJbWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjguNXB0Ow0KCWZvbnQtZmFtaWx5Ok1lbmxvOw0KCWNvbG9yOmJsYWNrO30NCnAu
cDIsIGxpLnAyLCBkaXYucDINCgl7bXNvLXN0eWxlLW5hbWU6cDI7DQoJbWFyZ2luOjBpbjsNCglt
YXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjguNXB0Ow0KCWZvbnQtZmFtaWx5Ok1l
bmxvOw0KCWNvbG9yOmJsYWNrO30NCnNwYW4uRW1haWxTdHlsZTIyDQoJe21zby1zdHlsZS10eXBl
OnBlcnNvbmFsOw0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndp
bmRvd3RleHQ7fQ0Kc3Bhbi5zMQ0KCXttc28tc3R5bGUtbmFtZTpzMTsNCgljb2xvcjojQjJCMkIy
Ow0KCWJhY2tncm91bmQ6YmxhY2s7fQ0Kc3Bhbi5zMw0KCXttc28tc3R5bGUtbmFtZTpzMzsNCgli
YWNrZ3JvdW5kOiM4NzhBMDQ7fQ0Kc3Bhbi5zNA0KCXttc28tc3R5bGUtbmFtZTpzNDsNCgljb2xv
cjojRUJFRjE4O30NCnNwYW4uczINCgl7bXNvLXN0eWxlLW5hbWU6czI7fQ0Kc3Bhbi5hcHBsZS1j
b252ZXJ0ZWQtc3BhY2UNCgl7bXNvLXN0eWxlLW5hbWU6YXBwbGUtY29udmVydGVkLXNwYWNlO30N
CnNwYW4uRW1haWxTdHlsZTI4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsOw0KCWZvbnQtZmFt
aWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0Kc3Bhbi5FbWFp
bFN0eWxlMjkNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWw7DQoJZm9udC1mYW1pbHk6IkNhbGli
cmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQpzcGFuLnBsLXMNCgl7bXNvLXN0
eWxlLW5hbWU6cGwtczt9DQpzcGFuLnBsLXBkcw0KCXttc28tc3R5bGUtbmFtZTpwbC1wZHM7fQ0K
c3Bhbi5FbWFpbFN0eWxlMzINCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWw7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQpzcGFuLkVtYWls
U3R5bGUzMw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToi
Q2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0
DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMC4wcHQ7fQ0KQHBh
Z2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBp
biAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30N
Ci0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIg
dmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVy
Om5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjQjVDNERGIDEuMHB0O3BhZGRpbmc6My4wcHQgMGluIDBp
biAwaW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNr
Ij5Gcm9tOiA8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+R3VubmFyIE1pbGxz
ICZsdDtnbWlsbHNAbGludXgudm5ldC5pYm0uY29tJmd0Ozxicj4NCjxiPkRhdGU6IDwvYj5Nb25k
YXksIEphbnVhcnkgNiwgMjAyMCBhdCA0OjQwIFBNPGJyPg0KPGI+VG86IDwvYj5WaWpheSBLaGVt
a2EgJmx0O3ZpamF5a2hlbWthQGZiLmNvbSZndDssICZxdW90O29wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZyZxdW90OyAmbHQ7b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJmd0Ozxicj4NCjxiPlN1Ympl
Y3Q6IDwvYj5SZTogd2VidWkgbm90IHdvcmtpbmcgZm9yIG1lPG86cD48L286cD48L3NwYW4+PC9w
Pg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPHA+PG86
cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T24gMS82LzIw
MjAgNjoyOSBQTSwgVmlqYXkgS2hlbWthIHdyb3RlOjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8
YmxvY2txdW90ZSBzdHlsZT0ibWFyZ2luLXRvcDo1LjBwdDttYXJnaW4tYm90dG9tOjUuMHB0Ij4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+Jm5ic3A7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkl0IHNheXMgb24gcGFnZSDigJx0aGVyZSBhcmUg
bm8gc2Vuc29ycyBhdmFpbGFibGXigJ08L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0K
PHAgc3R5bGU9Im1hcmdpbi1ib3R0b206MTIuMHB0Ij48c3BhbiBjbGFzcz0icGwtcyI+QSBjdXJs
IGNhbGwgdG8gL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycy9lbnVtZXJhdGUgcmV0dXJucyBh
bGwgdGhlIHNlbnNvcnMgY29ycmVjdGx5ID8NCjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIHN0
eWxlPSJtYXJnaW4tYm90dG9tOjEyLjBwdCI+PHNwYW4gY2xhc3M9InBsLXMiPkkgaGF2ZSBub3Qg
dXNlZCBhbnkgY3VybCBjb21tYW5kIGhlcmUuIFBsZWFzZSBsZXQgbWUga25vdyB3aGF0IGN1cmwg
Y29tbWFuZCB0byB1c2UuIEJ1dCBpbnRlbCBpcyB1c2luZyByZWRmaXNoIG1ldGhvZCB0byBnZXQg
dGhlc2UgZGF0YS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBzdHlsZT0ibWFyZ2luLWJvdHRv
bToxMi4wcHQiPjxzcGFuIGNsYXNzPSJwbC1zIj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
SW50ZWwtQk1DL3Bob3NwaG9yLXdlYnVpL2Jsb2IvZTM0ZjQ2YzE5MWE0Yzk5MzYwOGFjNjRhODY3
OTIwZmI2NDBlODEzMy9hcHAvY29tbW9uL3NlcnZpY2VzL2FwaS11dGlscy5qcyNMOTMyIj5odHRw
czovL2dpdGh1Yi5jb20vSW50ZWwtQk1DL3Bob3NwaG9yLXdlYnVpL2Jsb2IvZTM0ZjQ2YzE5MWE0
Yzk5MzYwOGFjNjRhODY3OTIwZmI2NDBlODEzMy9hcHAvY29tbW9uL3NlcnZpY2VzL2FwaS11dGls
cy5qcyNMOTMyPC9hPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIHN0eWxlPSJtYXJnaW4tYm90
dG9tOjEyLjBwdCI+PHNwYW4gY2xhc3M9InBsLXMiPjxicj4NCjxicj4NCklmIHNvLCBwcm9iYWJs
eSB3aWxsIG5lZWQgdG8gYWRkIHNvbWUgY29uc29sZS5sb2coKXMgdG8gdGhhdCBmdW5jdGlvbjxi
cj4NCjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXdlYnVpL2Js
b2IvZjcwZjQyNTUzNjE1OTcyMTYzYjM2YzliNGQ3N2JlMDdlNDM5OTEyMi9hcHAvY29tbW9uL3Nl
cnZpY2VzL2FwaS11dGlscy5qcyNMOTEyIj5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9z
cGhvci13ZWJ1aS9ibG9iL2Y3MGY0MjU1MzYxNTk3MjE2M2IzNmM5YjRkNzdiZTA3ZTQzOTkxMjIv
YXBwL2NvbW1vbi9zZXJ2aWNlcy9hcGktdXRpbHMuanMjTDkxMjwvYT48YnI+DQo8YnI+DQo8L3Nw
YW4+PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_F844EB41C241441899F852E75CF3ED2Cfbcom_--
