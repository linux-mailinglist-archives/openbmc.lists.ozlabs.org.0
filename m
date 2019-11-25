Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2213110973A
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 01:09:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MPRP2NstzDqHx
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 11:09:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=623285b47d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="K/S1PgR7"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="JcTT7YvX"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MP5P6MfPzDqfb
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 10:54:16 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id xAPNs9BR013257;
 Mon, 25 Nov 2019 15:54:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=nXsrGWJFJguQbfK5Spy7Iek93ty7rwGu6JV+DwhWjTE=;
 b=K/S1PgR7ec6vYhmJiNpDSklm4SbiGIzMxr1WYwNCseqAesXCoPCVHap3Bty7amYb3YAi
 l0jGZnbkc/dpoWVVxDUxRYVaf4t2kQxTgCFkhgUkZKR/U6WI6m44ahT1j20bq2krKKg4
 WSSe3wqD0w33tFOGDi5/e6Dr+DtPdizxHK8= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2wgqdygj4d-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 15:54:10 -0800
Received: from prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 25 Nov 2019 15:54:04 -0800
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 25 Nov 2019 15:54:04 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 25 Nov 2019 15:54:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxpBTGApKpzaHT2ujt8obwWnpnmT44MnZzRblpoOlhYzcmRUsW0PfZnSS6D/JpMx2E8B6n64LzYfxcYo5KfXtwqIaNNp0ayMWBjVCQDiNOaMCGU3XFhHSdDKexx4zSg5s5gujW7OyCUWY1Fou9xIoWTCTAoFTC8TeIJNLbpbFzPV142DGxp9mC9Rq0tzABzFyjzDiB92mVw9uQ2UBTBCOdUDZzdSj3xLMlJnyWStba+s0OhdJqXaV6pHARTwfium6vnMUZvVc5cCf2znYtJXQduebnOjoAdSSSd/1PXF000xI37TZHkeX1CJF7XARfBgT6LoU3uGJbAGTMGN0W2GGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXsrGWJFJguQbfK5Spy7Iek93ty7rwGu6JV+DwhWjTE=;
 b=KzIF/gP1PeX7dSwa8z5A2/TwjKSIUZR9qmfMu/W5x2WUBToxPreZsmNC2hJHTYLopluOW6zzKfgnG5M/x9d4IXRYiPsIQz+/kySJ98T60278UXgXQxZgi13+LvUk2PGfZrNCSiMqkafD5PAYk8C+5NS3vEtZNIc4I7wsVSe5sIbLPDnnIe9DCK1W2Dk3Ejfr4aeyezFqFTMhFZMI2qubrKUJKBcrz1U+4CrE1N7Kc7Lsy8h4+nTi3YocCy/pzI+WCSEK+dS1MNvzqAQKYbw5RWEGcRUZM51x1UhfRfwQEYthDV54tGsz8wCMKZPxTPog2Di3+IF6IklywT5ZwZy5sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXsrGWJFJguQbfK5Spy7Iek93ty7rwGu6JV+DwhWjTE=;
 b=JcTT7YvXgA/iBi6nglDnJk6vah3L1x+bej9KJNTTqGFf7r67LjOQnTIn1eqeeFkkbr/kJOIT8E9RF8TjWcFU6OJcMrfT0AlKnIZU5An2cgZ+Pcz4W57/eUYROCnZnZDVyDqJnIsqKs/Lq//dU3Gg+zWbdtfiRway15v2sNpBlmQ=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1903.namprd15.prod.outlook.com (10.174.100.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Mon, 25 Nov 2019 23:54:02 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::2c43:c44b:2c95:e376]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::2c43:c44b:2c95:e376%11]) with mapi id 15.20.2474.023; Mon, 25 Nov
 2019 23:54:02 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, James Feist
 <james.feist@linux.intel.com>, "jason.m.bills@linux.intel.com"
 <jason.m.bills@linux.intel.com>
Subject: Re: i2c error for ME port
Thread-Topic: i2c error for ME port
Thread-Index: AQHVo8gV2NOlHgDr9k+GwqBCoAIdRaecSPkAgAALJ4D//6bxAIAAi1yA//9+Y4CAAIbngP//fdSA
Date: Mon, 25 Nov 2019 23:54:02 +0000
Message-ID: <CF8AE44C-A68A-4E93-8711-5F3077C64EF5@fb.com>
References: <45A2E82C-17C3-470A-9756-DBC2CDFE0356@fb.com>
 <fcbbbc1b-d85c-d3d5-c2b6-9798828385ae@linux.intel.com>
 <69833bb8-89b6-2b06-818a-c8d16ce19ca5@linux.intel.com>
 <C4ECF587-E301-4FB7-AF5A-BB20F90F9083@fb.com>
 <960f28cb-3e53-14af-a2e7-63abeb0f9310@linux.intel.com>
 <78D819B8-5A29-444C-9048-2D2A0238BF11@fb.com>
 <d49b1081-0423-010d-44c7-70b14b64869e@linux.intel.com>
In-Reply-To: <d49b1081-0423-010d-44c7-70b14b64869e@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:182d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a10d317-b030-440c-ade2-08d77202bf7b
x-ms-traffictypediagnostic: MWHPR15MB1903:
x-microsoft-antispam-prvs: <MWHPR15MB1903BAF34FEBA157CDA099B4DD4A0@MWHPR15MB1903.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(376002)(366004)(39860400002)(346002)(189003)(199004)(316002)(2501003)(14454004)(2906002)(4326008)(110136005)(71200400001)(71190400001)(6512007)(478600001)(229853002)(6486002)(6116002)(8936002)(81166006)(256004)(8676002)(6436002)(6246003)(36756003)(81156014)(305945005)(5660300002)(53546011)(33656002)(99286004)(102836004)(6506007)(186003)(46003)(76176011)(2616005)(66556008)(86362001)(446003)(66476007)(66946007)(66446008)(7736002)(64756008)(25786009)(11346002)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1903;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5xI9lX8itYiV6t/zzr1fpHeoRF3CGXO3OVOMsIsoL8gAa0CNiK1mYUlmlanSIwHBxV7plJPHfVcnNZyI4p8FOAyNaSmpwBYHhs12DoQJLsqn1jDUSAmE/eFlGSYKA19kBAMWsJGXHwPfpRceWisOKSqt9Lvx9GkxYtKhos6pHe/W0noKkfvXiP6w8S/7Z890yda5E2mS5df/4C98p2yoAXVTDWDm+wkAEQZ4yLE9hww2Eb29lsEQiU3n5Am8zYmNdzmld2pthnns18w+qDxZz1oDGy3OiNX+/Yp6mF1a1YgTFC6WmHaECkVIXtXPpjPDR4UcUfG9cvt2zO7wHPYuHsHT7U73RTa0iUdEcxJc7VoQhI2wqW+uysBb/s9HuIWbjcqEUfbR2diTPTmDUgFGX+fGtUgn7cBGdiufyMRBeAc3dc7eMCjirf6n9gTM1lIZ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <129A42AEEE7E4C42A5C043493202E496@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a10d317-b030-440c-ade2-08d77202bf7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 23:54:02.3179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dC4m2A7x4HoQHzCLuOKdP5VN8hViWZ8wn0GC9YWD1tDt2seGKR3jiPO2CNw5eodnZk1PI8cw4313obPds/DjGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1903
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_06:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911250186
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

DQoNCu+7v09uIDExLzI1LzE5LCAzOjQwIFBNLCAiSmFlIEh5dW4gWW9vIiA8amFlLmh5dW4ueW9v
QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAgICBPbiAxMS8yNS8yMDE5IDM6MzcgUE0sIFZp
amF5IEtoZW1rYSB3cm90ZToNCiAgICA+IA0KICAgID4gDQogICAgPiBPbiAxMS8yNS8xOSwgMzoy
MSBQTSwgIkphZSBIeXVuIFlvbyIgPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20+IHdyb3Rl
Og0KICAgID4gDQogICAgPiAgICAgID4gJmkyYzQgew0KICAgID4gICAgICA+ICAgIHN0YXR1cyA9
ICJva2F5IjsNCiAgICA+ICAgICAgPiAgICAvLyBCTUMgRGVidWcgSGVhZGVyDQogICAgPiAgICAg
ID4gICAgaXBtYjBAMTAgew0KICAgID4gICAgICA+ICAgICAgY29tcGF0aWJsZSA9ICJpcG1iLWRl
diI7DQogICAgPiAgICAgID4gICAgICByZWcgPSA8MHgxMD47DQogICAgPiAgICAgID4gICAgICBp
MmMtcHJvdG9jb2w7DQogICAgPiAgICAgID4gICAgfTsNCiAgICA+ICAgICAgPiB9Ow0KICAgID4g
ICAgICANCiAgICA+ICAgICAgSWYgaXQncyBmb3IgQk1DLU1FIGNoYW5uZWwsIHlvdSBzaG91bGQg
YWRkICdtdWx0aS1tYXN0ZXI7JyB0byBlbmFibGUgSC9XDQogICAgPiAgICAgIGFyYml0cmF0aW9u
LiBBbHNvLCB5b3Ugc2hvdWxkIHNldCB0aGUgc2xhdmUgYWRkcmVzcyBsaWtlIGJlbG93IGFmdGVy
DQogICAgPiAgICAgIGluY2x1ZGluZyAnI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2kyYy9pMmMuaD4n
IGluIGR0cyBmaWxlLg0KICAgID4gICAgICANCiAgICA+ICAgICAgcmVnID0gPCgweDEwIHwgSTJD
X09XTl9TTEFWRV9BRERSRVNTKT47DQogICAgPiAgICAgIA0KICAgID4gSSBjaGFuZ2VkIHRvIHRo
aXMNCiAgICA+ICZpMmM0IHsNCiAgICA+ICAgIHN0YXR1cyA9ICJva2F5IjsNCiAgICA+ICAgIG11
bHRpLW1hc3RlcjsNCiAgICA+ICAgIC8vIEJNQyBEZWJ1ZyBIZWFkZXINCiAgICA+ICAgIGlwbWIw
QDEwIHsNCiAgICA+ICAgICAgY29tcGF0aWJsZSA9ICJpcG1iLWRldiI7DQogICAgDQogICAgV2hh
dCBoYXBwZW5zIGlmIHlvdSB1c2UgInNsYXZlLW1xdWV1ZSIgaW5zdGVhZD8gQXJlIHlvdSBtb2Rp
ZnlpbmcgSVBNQg0KICAgIGNoYW5uZWwgc3VwcG9ydCB1c2luZyB0aGUgaXBtYiBrZXJuZWwgZHJp
dmVyPw0KDQpObywgSSBhbSBqdXN0IHVzaW5nIHRoaXMgSVBNQiBrZXJuZWwgZHJpdmVyIGFzIHJl
Y2VpdmluZyBhbmQgc2VuZGluZyBpcG1iIHBhY2tldHMuDQpBbGwgY2hhbm5lbCBzdXBwb3J0IGlz
IGluIGlwbWJicmlkZ2UgYXBwbGljYXRpb24gb25seS4gDQoNCkxldCBtZSBzd2l0Y2ggYmFjayB0
byBtcXVldWUgc2xhdmUgZHJpdmVyIGFuZCBzZWUgaWYgcHJvYmxlbSBzdGF5cy4NCiAgICANCiAg
ICA+ICAgICAgcmVnID0gPDB4NDAwMDAwMTA+Ow0KICAgID4gICAgICBpMmMtcHJvdG9jb2w7DQog
ICAgPiAgICB9Ow0KICAgID4gfTsNCiAgICA+IEJ1dCBubyBpbXByb3ZlbWVudC4gSW4gZmFjdCBz
b21ldGltZXMgSSBhbSB1bmFibGUgdG8gY29tbXVuaWNhdGUgd2l0aCBNRSB2aWEgaTJjLg0KICAg
ID4gICAgICBDaGVlcnMsDQogICAgPiAgICAgIA0KICAgID4gICAgICBKYWUNCiAgICA+ICAgICAg
DQogICAgPiANCiAgICANCg0K
