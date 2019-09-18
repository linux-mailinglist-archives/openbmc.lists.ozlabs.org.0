Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA0CB58D9
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 02:08:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Y0gm63hZzDrQX
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 10:08:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=41641c7681=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="iV5UKlvF"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="F69n0/Vw"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Y0g31Z68zF3mW
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 10:07:54 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8I03vOr016375; Tue, 17 Sep 2019 17:07:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=A1DWEyhHsxu8SggsiAVMJMeLaVE1FhxPB2zopUq4VZI=;
 b=iV5UKlvFlV62bqdrkGwBm0NxMGenrp5PSL3hDuHOQSA52hCI32UbBUSL2mM2dVYoUfgY
 WhwZWYQm1pr8crJASzxG4B6FVZJn9ZpqcIykSGnqBvNGloPfPk00Uzu5e5LtWru0Czwg
 DSopJWARHJyoexBJIRwczNYnKDOFE5Ku14M= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2v37j78gy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 17 Sep 2019 17:07:51 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
 ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Sep 2019 17:07:49 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 17 Sep 2019 17:07:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cb3x59fqvgejZl5BeYcu1ZSwdkiwBT5puKLoy+GuaNAZ2LHxnwUQnvK3VvB4+eIMj/HAmJffbVxZ2VlX9bNJoi+peurkTLndT2zmXB6kxx4mEBKbOtQBRZmbpJEJs5TTw0r2KWHSDIISih48XjqCJeSKwWtRQb7t2f7jtlbQiMBcQItOFX7HSrqKI0+ZXJT5NyewqNoQ0Pfou2Hq+py8q+1a6PpDLDRylRM37pinADp4TGzTApeELJTJbkSLswOOCgqu9AdNyd5sJKnU5ntm1p3p6gqiOXQ5ScKlP/u3LTZrUuAv2FjoJu9DRYbdH54wplPbpNmqpbQkCiXTOBAJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1DWEyhHsxu8SggsiAVMJMeLaVE1FhxPB2zopUq4VZI=;
 b=WX/Uw1p5U+vohy9WQJstKfq/rsClvIGLbLbuHWQ6AsLCPhyhZ889HeaOM91z35njBPSGnV+YD2Up4GH2YdJmQ4EJKzhL5nusw8ZjT1zgrNuK3KEf7MUG15ELQJQAvW9dtgh5Xxlha4S4qtPQNrnkLf9Sk3MAJJer/vW6qMEJfWntvXnY4xvzf5qymHlWltNPLNXNAv5wf/CsghwwSLXN0NLhpaRSbVEWr9yuBdlYLBE2kEBP5ZCN1Lmvn6Z/P1pbpWoPfgRKNY4GGXKdEr/QU4IUbUY6VouS1gaF9AkIWZAw1UsS4JYT2yTfe6rGHAAG5ZqI4ZYoYvugnSIqKhOhMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1DWEyhHsxu8SggsiAVMJMeLaVE1FhxPB2zopUq4VZI=;
 b=F69n0/Vw6rHIy47uJeoS1zKNTCpVr3ak/d1pqXQeCj7EQmDlVTJ0LAhvXnD1EVhert/zj/p1SoIpqkh8McypkowPfAAsYX2gSfPbjbJiNK4aKnQOPLPYGhLpBP7GUm939k9K0WavXwckCaBGrk/MgMOsDrDh6n26BVYcc9w6tDw=
Received: from DM5PR15MB1211.namprd15.prod.outlook.com (10.173.210.138) by
 DM5PR15MB1897.namprd15.prod.outlook.com (10.174.247.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 18 Sep 2019 00:07:46 +0000
Received: from DM5PR15MB1211.namprd15.prod.outlook.com
 ([fe80::9c67:420:3467:3931]) by DM5PR15MB1211.namprd15.prod.outlook.com
 ([fe80::9c67:420:3467:3931%12]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 00:07:46 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Moving kernel to Linux 5.3
Thread-Topic: Moving kernel to Linux 5.3
Thread-Index: AQHVbHdkeP497F4LLUydTUrEh0gpZ6cwkUEA
Date: Wed, 18 Sep 2019 00:07:46 +0000
Message-ID: <d712d41d-72dc-0ed0-c337-64bca2e6d30d@fb.com>
References: <CACPK8XcVoi7KmWaBz3KoEcv2mGJSmMGm2Rxu66jWU+BC8pOrqw@mail.gmail.com>
In-Reply-To: <CACPK8XcVoi7KmWaBz3KoEcv2mGJSmMGm2Rxu66jWU+BC8pOrqw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR11CA0024.namprd11.prod.outlook.com
 (2603:10b6:301:1::34) To DM5PR15MB1211.namprd15.prod.outlook.com
 (2603:10b6:3:b5::10)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:da8b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f2778bf-6c47-49fd-9935-08d73bcc3c0a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR15MB1897; 
x-ms-traffictypediagnostic: DM5PR15MB1897:
x-microsoft-antispam-prvs: <DM5PR15MB1897C173FDD23C0D7E297BB2B28E0@DM5PR15MB1897.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(396003)(366004)(39860400002)(346002)(189003)(199004)(14454004)(2906002)(71190400001)(6506007)(7736002)(66556008)(6512007)(81166006)(76176011)(58126008)(478600001)(71200400001)(316002)(31686004)(64756008)(66476007)(256004)(66946007)(46003)(99286004)(66446008)(8676002)(229853002)(53546011)(5660300002)(31696002)(6436002)(36756003)(52116002)(81156014)(6486002)(486006)(25786009)(386003)(65956001)(2616005)(11346002)(6246003)(446003)(110136005)(4744005)(65806001)(186003)(6116002)(86362001)(8936002)(305945005)(476003)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR15MB1897;
 H:DM5PR15MB1211.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: szGFZpMK9IchN3JhFnJ+05q9KXyYV01ScK0Hb3vGSIXiJHlidsyhy30h24RJLBo7bgQBLMpxSasvClKtk1T4e31gdWdNMXv1XMOM+GODSIveGo7g5LXKlm40b7bFJ+xPlgNWUfdjbuhmYQaONBEbhuLt+AdCYKzbyw9d8FCZJq/cwnu99fDgCaDfykKceo5vH02ADHLgQcASjbv+AdjPyeOEN9KS2XsFrcx7rdzzJuETE1AejEo2lJoCZY2fxXUIcEkoSKl8zfdeQI5kzD4NmZAtpGcJ6mJMLB861JieGPCnzRTO6Acv3o21kkC5ElATwWv7D/KdTopBDmUsTsJqXdphZEQUkiat8+o/HjWNOn9gNALmpvwtdnR0jBgz1jHS0VnkJH8xmRGXGXMz5Ak1itlAaZHUZRT8WIif4AKc30o=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4919140B7F50E34FA55B9B7C56A3EF63@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2778bf-6c47-49fd-9935-08d73bcc3c0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 00:07:46.6677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vGEpyjh6hMBcU88c8uCGsKOlnEQFCFJ2jHMPwdBvKYmJS//6B4lOnNeyiW6WBt7B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR15MB1897
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-17_13:2019-09-17,2019-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0 bulkscore=0
 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909170221
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

T24gOS8xNi8xOSAzOjEyIEFNLCBKb2VsIFN0YW5sZXkgd3JvdGU6DQo+IFdpdGggTGludXggdjUu
MyB0YWdnZWQgdG9kYXkgSSd2ZSBjcmVhdGVkIGFuIG9wZW5ibWMgdHJlZSBiYXNlZCBvbiB0aGlz
IHJlbGVhc2UuDQo+IA0KPiBXZSBoYXZlIDEyMCBwYXRjaGVzIGluIGRldi01LjMuIE9mIHRoZXNl
LCA1NiBhcmUgYmFja3BvcnRlZCBmcm9tDQo+IHVwc3RyZWFtLCBsZWF2aW5nIDY0IG91dCBvZiB0
cmVlIHBhdGNoZXMuIFRoZXNlIG91dCBvZiB0cmVlIHBhdGNoZXMNCj4gaW5jbHVkZSBsb25nIHN0
YW5kaW5nIG10ZCBhbmQgZmFuIGNvbnRyb2xsZXIgY2hhbmdlcywgdGhlIGFnaW5nIFBFQ0kNCj4g
cGF0Y2ggc2V0LCBhbmQgYSBmZXcgTnV2b3RvbiBkcml2ZXJzLg0KPiANCj4gTW9zdCBvZiB0aGUg
cGF0Y2hlcyBmcm9tIGRldi01LjIgYXJlIGNhcnJpZWQgb3Zlci4gT25lIGV4Y2VwdGlvbiBpcw0K
PiB0aGUgYXNwZWVkIGkyYyBleHBlcmltZW50cywgd2hpY2ggSSBoYXZlIGFza2VkIEphZSB0byBw
b3N0IHVwc3RyZWFtDQo+IGZvciByZXZpZXcgYmVmb3JlIHdlIGluY2x1ZGUgdGhlbSBhZ2Fpbi4N
Cj4gDQo+IFRoaXMgdHJlZSBjb250YWlucyBzdXBwb3J0IGZvciB0aGUgYXN0MjYwMCB0aGF0IHdh
cyBtZXJnZWQgaW4gNS40Lg0KPiANCj4gSSBoYXZlIHRlc3RlZCBvbiBhc3QyNDAwIChwYWxtZXR0
byksIGFzdDI1MDAgKHJvbXVsdXMpLCBhc3QyNjAwDQo+IChwYWxtZXR0byksIGJvdGggaGFyZHdh
cmUgYW5kIHFlbXUgKGFzcGVlZC00LjIgYnJhbmNoKS4gRnVydGhlcg0KPiB0ZXN0aW5nIGFuZCBh
ICsxIG9mIHRoaXMgcmV2aWV3IHdvdWxkIGJlIGFwcHJlY2lhdGVkOg0KDQorMSAodGVzdGVkIG9u
IENNTSBBU1QyNTAwIEJNQykuDQoNCkNoZWVycywNCg0KVGFvDQo=
