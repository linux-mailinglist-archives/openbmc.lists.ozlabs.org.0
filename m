Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B93C61FCD5
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 02:08:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454Bbb5CTXzDqWx
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 10:08:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=00395a56d3=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="lSURGqNb"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="NVvt4tuy"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454BZk6svmzDqWK
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 10:07:54 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x4FNwda5002709;
 Wed, 15 May 2019 17:07:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=0DLcWx413zfXh2CgxFH0eiEdl097QHnweyGC/88XM7w=;
 b=lSURGqNblp9QgYL14OW04qotf0aCZ2uD0CtuToYBBP1xakIxvYLH8M6JQ2oZcu/mKMvx
 gyHeCJzTu+1JyFeF0BVtnCPB4DC0RAIcSvCuSvZSnKec9lsIJXfhY8Gf8F0uN+c6bLhq
 2gijmmUAhtk6knZJILF6hnW2+adcAVoP1zs= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2sgtfeggb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 15 May 2019 17:07:48 -0700
Received: from prn-mbx08.TheFacebook.com (2620:10d:c081:6::22) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 15 May 2019 17:07:47 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-mbx08.TheFacebook.com (2620:10d:c081:6::22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 15 May 2019 17:07:47 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 15 May 2019 17:07:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DLcWx413zfXh2CgxFH0eiEdl097QHnweyGC/88XM7w=;
 b=NVvt4tuy9j/ErEYtmHjBC3wP0TvLSaKUmnF7MLnLRE/Kl5jmk+KXkUYX0urmFfbqG3Vx6tX8fUGP2zw/0eD9H15VWd9HtLEh03R/EYRqI1wJDKUAqtsDOQGrxmNVYsNJWeSKu4w0p2RINMBzOFjPiqSFuFOQNs1hcyFgXYBMonY=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1703.namprd15.prod.outlook.com (10.174.53.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.26; Thu, 16 May 2019 00:07:45 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::517c:210f:bedf:9091]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::517c:210f:bedf:9091%8]) with mapi id 15.20.1878.024; Thu, 16 May 2019
 00:07:45 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed.tanous@intel.com>, Patrick Venture <venture@google.com>
Subject: Re: pid control configuration
Thread-Topic: pid control configuration
Thread-Index: AQHVAHC+JTVF079u7EWEF1cz6ijBgKZW49mAgAEiSgCABkgqgIAGJ+UAgATbwQCAABC4AIACzgEAgACe5AD//7D6AA==
Date: Thu, 16 May 2019 00:07:45 +0000
Message-ID: <0878853E-E38E-4B48-870F-C538637E2F36@fb.com>
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
 <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
 <7D337AEA-CB20-4E39-8A9A-58E21EDA0F31@fb.com>
 <1b82951d-4293-0525-a562-000899544c2e@intel.com>
 <14F05B01-0B7D-44D1-A599-5EDD8CC3A6C8@fb.com>
 <CAO=notzQc2CX9Dx4gjX6HwnuCKnjmD_3ek+tv-XAfO+LxdQ3WA@mail.gmail.com>
 <b058940e-ae1b-d238-c9b1-885252ba2464@intel.com>
 <235B9067-D22E-439F-9009-F3D6C2A70993@fb.com>
 <945b4275-2441-8562-7efe-5bc7a9eca4f7@intel.com>
In-Reply-To: <945b4275-2441-8562-7efe-5bc7a9eca4f7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::e587]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbdb2ca6-d312-41a1-f848-08d6d99285f0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1703; 
x-ms-traffictypediagnostic: CY4PR15MB1703:
x-microsoft-antispam-prvs: <CY4PR15MB17032C1B38588DD282E6A6A2DD0A0@CY4PR15MB1703.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(366004)(396003)(136003)(39860400002)(189003)(199004)(7736002)(53936002)(14444005)(256004)(4744005)(3480700005)(7116003)(83716004)(71200400001)(33656002)(25786009)(4326008)(68736007)(6512007)(6116002)(14454004)(305945005)(6246003)(71190400001)(5660300002)(2616005)(186003)(46003)(8936002)(229853002)(102836004)(53546011)(66556008)(8676002)(6506007)(66476007)(476003)(66946007)(486006)(110136005)(64756008)(66446008)(6436002)(76176011)(6486002)(91956017)(11346002)(76116006)(2906002)(73956011)(316002)(36756003)(446003)(82746002)(478600001)(81156014)(81166006)(86362001)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1703;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ezIQcw/IaTe0wbQidxpKPD2xLPdGlQH7xyhylx/i+B6Pypii9pmQKXHo/n5aIuDKPoiSbRSz98sQuiuO80M9xA9+yY5oHSFLbKM8UGN+OnNGuE5kPHTkqmKLQiQJ0CPDUABvuQhxXIhLM4AwSucgMGOR4mNw81LFi3JFDvSxXI7cfL25lzI1IIFKPgHv9FbSbp7+kHIo70qa0Dwo+KtVluslusb0RJDGArFAhGN03Xf5Bh24NYX+2FP649ud+wGCpbObqhK3MqmXWBXhakp1Giw3mY0w770jv62FMDlxknxDvgmYjXQCIc50JRPHc8wNJPQJk7D7WL3s0ztQPq+jv0I/mk0LzowqRlngCZRZuN/5arJJt1RSaX0lwfdxWJE3CbkP1hEECx1dqXpkLIawZLMe3vRsOxFFp9w8nSFrJQI=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B627E847E59EE643A98E0DB572A017D5@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdb2ca6-d312-41a1-f848-08d6d99285f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 00:07:45.3417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1703
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-15_17:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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

T24gNS8xNS8xOSwgMjo1MCBQTSwgIkVkIFRhbm91cyIgPGVkLnRhbm91c0BpbnRlbC5jb20+IHdy
b3RlOg0KDQogICAgT24gNS8xNS8xOSAxMjoyMSBQTSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAg
ID4gDQogICAgPiANCiAgICA+IEVkLCBwbGVhc2Ugc2VlIGlmIGZvbGxvd2luZyBkZWNsYXJhdGlv
biBpbiBlbnRpdHkgbWFuYWdlciB3b3VsZCB3b3JrIGFzIEkgYW0gbm90IGRlZmluaW5nIGFueSBw
aWQgdmFsdWVzIGhlcmUuDQogICAgPiAgICAgICAgIHsNCiAgICA+ICAgICAgICAgICAgICJDbGFz
cyI6ICJmYW4iLA0KICAgID4gICAgICAgICAgICAgIklucHV0cyI6IFsNCiAgICA+ICAgICAgICAg
ICAgICAgICAiTUJfRkFOMF9UQUNIIg0KICAgID4gICAgICAgICAgICAgXSwNCiAgICA+ICAgICAg
ICAgICAgICJOYW1lIjogIk1CX0ZBTjBfVEFDSCIsDQogICAgPiAgICAgICAgICAgICAiT3V0cHV0
cyI6IFsNCiAgICA+ICAgICAgICAgICAgICAgICAiUHdtIDEiDQogICAgPiAgICAgICAgICAgICBd
LA0KICAgID4gICAgICAgICAgICAgIlR5cGUiOiAiUGlkIiwNCiAgICA+ICAgICAgICAgICAgICJa
b25lcyI6IFsNCiAgICA+ICAgICAgICAgICAgICAgICAiUGlkIDEiDQogICAgPiAgICAgICAgICAg
ICBdDQogICAgPiAgICAgICAgIH0sDQogICAgPiAgICAgDQogICAgPiAgICAgPj4NCiAgICA+ICAg
ICA+PiBSZWdhcmRzDQogICAgPiAgICAgPj4gLVZpamF5DQogICAgPiAgICAgPj4NCiAgICA+ICAg
ICANCiAgICA+IA0KICAgIA0KICAgIEknbSBhc3N1bWluZyB5b3UgbG9hZGVkIHRoaXMgb24gYSBz
eXN0ZW0uICBJZiBpdCBnYXZlIHlvdSB0aGUgYmVoYXZpb3INCiAgICB5b3UncmUgbG9va2luZyBm
b3IsIHlvdSdyZSBkb25lLiAgSWYgaXQgZGlkbid0LCBpdCdzIHByb2JhYmx5IHRpbWUgdG8NCiAg
ICBzdGFydCBkZWJ1Z2dpbmcgYW5kIHR1bmluZy4NCg0KVGhhbmtzLCBObywgSSBoYXZlIG5vdCB5
ZXQgdGVzdGVkIHRoaXMgYnV0IEkgY2FuIHN0YXJ0IHRoaXMgb25jZSB3ZSBoYXZlIG91ciBwaWQg
ZGF0YSBhbmQgdXBkYXRlIGRvY3VtZW50YXRpb25zLg0KICAgIA0KICAgIEkgcnVuIG15IHN5c3Rl
bXMgaW4gdGhlIGNhc2NhZGUgY29udHJvbGxlciBzZXR1cC4gIElmIHlvdSdyZSBkZXZpYXRpbmcN
CiAgICBmcm9tIHRoYXQsIHlvdSdsbCBsaWtlbHkgZmluZCBzb21lIHBsYWNlcyB0aGF0IG5lZWQg
YmV0dGVyIGRvY3VtZW50YXRpb24NCiAgICBhbmQgY29kZSBpbXByb3ZlbWVudHMuDQogICAgDQoN
Cg==
