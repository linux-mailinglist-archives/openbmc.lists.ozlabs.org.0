Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4851EEA21
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 20:15:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dDTT5l0kzDqgn
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 04:15:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0424258c87=jean-marie.verdun@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 2228 seconds by postgrey-1.36 at bilbo;
 Fri, 05 Jun 2020 04:14:11 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dDSM1NgDzDqV8
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jun 2020 04:14:09 +1000 (AEST)
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 054HSQ32018259; Thu, 4 Jun 2020 17:36:56 GMT
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
 by mx0a-002e3701.pphosted.com with ESMTP id 31f53r87j1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 17:36:56 +0000
Received: from G1W8108.americas.hpqcorp.net (g1w8108.austin.hp.com
 [16.193.72.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2354.austin.hpe.com (Postfix) with ESMTPS id 68081A0;
 Thu,  4 Jun 2020 17:36:55 +0000 (UTC)
Received: from G1W8107.americas.hpqcorp.net (2002:10c1:483b::10c1:483b) by
 G1W8108.americas.hpqcorp.net (2002:10c1:483c::10c1:483c) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 4 Jun 2020 17:36:55 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.241.52.11) by
 G1W8107.americas.hpqcorp.net (16.193.72.59) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 4 Jun 2020 17:36:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSrd7v6Zdai0dEI0sQdfTK+yhCSN9Bv+GWkwEqyycvvSTR2csXKffkfUL//u3EBzORqN3AQnyM/bRSBxs005P83X9EQFVQkSvwfSMbFwtrX/etlT1nvtI5lev+KCZlsU9PZtZvGy8S26PvoWAIVbOetLllNL65d7tbj8YgPE/MVH9fUUYCSbQbmSUlA5vZdLrY0fP7TmFXPAuSeKQTlOSAKJt8+ZvvBZcx+xQiq2MbmredKQuTPavI1bPjsiYAqtUrDBtneHJqCoadq/Ka6mfZWEorZ2KVWmwhORTKFv7ckA4ZGRqHsGoXqNK5/kK1Jy02Mel+3L91GOs7zSPA1CUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDW2MwOEe+pGO2WXvoZNdsAR+TbrOzOmT6Peh6nJ2c8=;
 b=WhcmHpbgd0ZvTD/Gy9GlVdl0aEvc1Vi0+ERC56yRRzfVPideRRy3n/debCcx78PljDBM/LuulUhlbTmbb2ezwF96PFoy0sLNhLRFpEZrt7aE9ce/+16NNEuhgZ0iaiUmKpu9ngxYrPB5TseviH51UL99+jaQmTyKnq5ipa6llE/T6yc5Yj5sDjt2+XNt6YY1nFIoWWbLjJJAq3fnWw4UD8PyzxtNlqyDJud+kizvp4Yns2MIy+pYUmIFuKytJv+dhOFeYXF0QwPTGYYL2P4V+tNrl28i3WnIAlqr6eVsE241352cqFYq8SsTJt2bGFMEVYWDZ/O0pPU8FNNitAOC4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7423::13) by AT5PR8401MB1073.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7425::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 4 Jun
 2020 17:36:54 +0000
Received: from AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f8f6:4c42:56e7:1387]) by AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f8f6:4c42:56e7:1387%12]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 17:36:53 +0000
From: "Verdun, Jean-Marie" <jean-marie.verdun@hpe.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Garrett, Mike (HPE Server
 Firmware)" <mike.garrett@hpe.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Hello to OpenBMC Team
Thread-Topic: Hello to OpenBMC Team
Thread-Index: AdY5H1rW6HuPnkiDQLa/gQ+ggEN4bwAvS7cAAABBDeAAKLaKgP//6ZqA
Date: Thu, 4 Jun 2020 17:36:53 +0000
Message-ID: <CCD31820-98CA-496A-9C0D-21EB336C9168@hpe.com>
References: <DF4PR8401MB11451AC66E463D2EC408D2CA8F8B0@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
 <511713b5b1f66805a79ffadde5ba09a70db4c6fc.camel@fuzziesquirrel.com>
 <DF4PR8401MB1145F2F1E0F66E7DA633D85F8F880@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
 <f590449eb4146a1c68560aa89ed5e61b3e4cd64c.camel@fuzziesquirrel.com>
In-Reply-To: <f590449eb4146a1c68560aa89ed5e61b3e4cd64c.camel@fuzziesquirrel.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none; fuzziesquirrel.com; dmarc=none action=none header.from=hpe.com; 
x-originating-ip: [2601:582:4681:bb70:490d:b933:4a5f:fd49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f9e3a65e-f057-49d4-03f2-08d808addf33
x-ms-traffictypediagnostic: AT5PR8401MB1073:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AT5PR8401MB1073C8A433CE1C04461788F2A7890@AT5PR8401MB1073.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JyBsvXyOz+FwZihMkDewNyvkYasuQ7dT3dJk2aCUWvaz+iO5JP6lDRstCPRuLmSQvIRuuEJt9cOjBb1CEX0FFPzErM4Up2Qyl77QFW3GicVzEZqiegtYYSvBpAt9fU5GmypFsdYs+ZWb2HNkOSqGU6HFgvnm+Lwf068HmUHz3C4K0LQ506AkiKIsU+SlBWXmSYv4Gy6I0LowWETj0ttwFSqy8X/0BvWUfxLxpg2VC2o0H0cbUuA0zwgXyEagkwHwV2XPW/53ZlM5GXt/E/jQyCB9csiigh8FBdF4n4brO2L4xnuUwE8yQVvC8yvLPdHD026+mjGiJXw7wEDeXXEhQkVKFX3B/EnV3wysjo6vgTA/LYL3Y/ALqFfBXAlae2lTRyznnIIat/RTcfB+3ZOIRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(346002)(39860400002)(366004)(376002)(396003)(6512007)(86362001)(64756008)(3480700007)(8676002)(66556008)(66476007)(83380400001)(2616005)(6506007)(316002)(66946007)(71200400001)(8936002)(76116006)(66446008)(186003)(478600001)(6486002)(33656002)(2906002)(36756003)(54906003)(5660300002)(966005)(110136005)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Gws+FduiSVOH50lTLDVqKWSCRenlJ8LpG/lBqrRzdMEMVcEftHwdKmKZ524z2/21df/Gl92lgNtNZlXeZlGxiLutbLvXKVPdYkUqVI5aSMOXc+vZo0Mo+MvOCJRmUs8J5cP6Oth238oMrSLn/QllmK7ZYL1XQ+2Z5UvMyl486DiulLmgyr3KVUA6kCxEhUWnyyaI5hH3fTHszZTGQyoFVDP0Ap58B2s//HHpggwy3xLIzrBIMmRvOvc1NuckPREWMr8yRYp86Bqn8HHx3/v9qdspG00zgW49Z20teTyTdWO7DPQIZ86OCqsQ9ySlZS9YB+d4uzXY6Xlxa1HGLhEBaS9ELksBNhED6KqSm8OmGGUhsxUTIEju++hUGdvRF6JtpsaiLndF7YKcEWMWabSWW9xsIntjDy0QL5+zLfsFyIU4mxc78rmDcV0TvF2s8l60Qg7f5Gmy3QDHCb4x/A5zaGPnY7q/rKTah3RXEjIitIyOxQ/FAnY5IGWs28eaYOoZvN5G2MFH09o9ssc7WKmHK5HDlZ1urkNAvt3xhQuUczDcZsDLEZvsYqGvxU2lZzlS
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDB5B21F0C87484C8A9343F3B06B0F05@NAMPRD84.PROD.OUTLOOK.COM>
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e3a65e-f057-49d4-03f2-08d808addf33
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 17:36:53.7913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VC1IUMQR6gvcgntPzseyzByFE5s77paQWWVi7X2f77dofTR07WMRvGaMHM5PC76Tz1LmXje3gFfB13kC7J1bH7m95h7Bbp/4HZFtFzf1sC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB1073
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_12:2020-06-04,
 2020-06-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 cotscore=-2147483648 clxscore=1011 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006040122
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
Cc: "Shaffer, Scott" <scott.shaffer@hpe.com>, "Cisneros,
 Jorge \(George\)" <jorge.cisneros@hpe.com>, "Rodgers,
 Renee" <renee.rodgers@hpe.com>, "Chung, 
 John \(TWN iLO\)" <john.chung@hpe.com>, "Chen, Gilbert" <gilbert.chen@hpe.com>,
 "Newman, Edward \(iLO Firmware\)" <edward.newman@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQnJhZCwNCg0KSSByZWFsaXplIHRoYXQgd2UgYXJlIG5vdCBpbiB0aGUgYmVzdCBjb25kaXRp
b24uIFdlIGZhY2VkIG11bHRpcGxlIGNoYWxsZW5nZXMgYmVmb3JlIGJlaW5nIGFibGUgdG8gYXJy
aXZlIHRvIHN1Y2ggc3RhZ2UuIFRoZSBmaXJzdCBvbmUgaXMgYSBjaGlja2VuIGFuZCBlZ2cgaXNz
dWUsIHJlbGF0ZWQgdG8gdGhlIG5lZWQgdG8gY3JlYXRlIHNvbWUgbW9tZW50dW0gaW5zaWRlIEhQ
RSB0byBiZSBhYmxlIHRvIHN0YXJ0IHdvcmtpbmcgb24gYSBwcm9qZWN0IGxpa2UgT3BlbkJNQy4g
VG8gcmVhY2ggaXQgd2UgaGFkIHRvIGNyZWF0ZSBhIFByb29mIG9mIENvbmNlcHQsIHdoaWNoIG5l
ZWRlZCB0aGF0IHdlIHdvcmtlZCBvbiBvdXIgR1hQIGFzaWMgc3VwcG9ydCBhbmQgaW50cm9kdWNl
IHBhdGNoZXMgaW50byB0aGUgb3JpZ2luYWwgc291cmNlIHRyZWUgdGhhdCB3ZSBmb3JrZWQuIEF0
IHRoZSBQb0MgbGV2ZWwsIHdlIHN0aWxsIGNvdWxkIGhhdmUgZW5kZWQgdXAgaW50byBhIHNpdHVh
dGlvbiB3aGVyZSB3ZSB3b3VsZCBoYXZlIGRyb3BwZWQgdGhlIHdvcmsuDQoNCldlIHVzZWQgdGhh
dCBQb0MgdG8gZGVtb25zdHJhdGUgdGhlIHZhbHVlIG9mIE9wZW5CTUMgb24gdG9wIG9mIG91ciBo
YXJkd2FyZSB0byBwdWJsaWMgYW5kIHByaXZhdGUgY3VzdG9tZXJzLCBsZWFkaW5nIHRvIGEgZ3Jl
ZW4gbGlnaHQgdG8gam9pbiB0aGUgcHJvamVjdC4gDQoNCkkga25vdyB2ZXJ5IHdlbGwgdGhlIHBh
aW4gdG8gbWFpbnRhaW4gYSBmb3JrIG9mIGEgcHJvamVjdCwgYW5kIEkgYmVsaWV2ZSBtb3N0IG9m
IHRoZSBIUEUgdGVhbSBhbHNvLiBXZSB3aWxsIHdvcmsgcHJldHR5IGhhcmQgYXQgdGhlIGVhcmx5
IHN0YWdlIG9mIHRoZSBwcm9qZWN0IHRvIHVwc3RyZWFtIHdoYXQgaXMgbmVlZGVkIGp1c3QgdG8g
YmUgc3VyZSB0aGF0IHdlIGRvIG5vdCBlbmQgdXAgaW50byBhIGNvbXBsZXggc2l0dWF0aW9uLiBN
eSBpZGVhbCBnb2FsIGlzIGFsd2F5cyB0byBjb21taXQgdXBzdHJlYW0gaW5zdGVhZCBpbnRvIGEg
Zm9yaywgYW5kIEkgc2hhcmUgeW91ciBjb25jZXJucy4gV2Ugd2lsbCBwcm9iYWJseSBoYXZlIGEg
cm9sbGVyY29hc3RlciByaWRlIGF0IHRoZSBiZWdpbm5pbmcgZHVlIHRvIHRoZSBhbW91bnQgb2Yg
Y29kZSB0byBpbnRyb2R1Y2UsIGJ1dCB3ZSBhcmUgcmVhZHkgdG8gYWRhcHQgdG8gdGhlIGNvbW11
bml0eSBuZWVkcy4NCg0KSSBkbyBjb250cmlidXRlIHRvIG90aGVyIHByb2plY3RzIGxpa2UgRnJl
ZUNBRCwgd2hpY2ggYXJlIGh1Z2UgcGllY2Ugb2YgY29kZSwgYW5kIG1haW50YWluIHRoZSBzbmFw
IG9mIGl0LiBTbyBmb3JraW5nIGlzIG5ldmVyIGEgZ29vZCBpZGVhLCBleGNlcHQgaWYgeW91IHdh
bnQgdG8gYnVpbGQgYSBzZXBhcmF0ZSBwcm9qZWN0LCB3aGljaCBpcyBjbGVhcmx5IG5vdCBvdXIg
aW50ZW5kICEgV2Ugd2FudCB0byBiZSBwYXJ0IG9mIHRoaXMgY29tbXVuaXR5LCBhbmQgbWFrZSBp
dHMgc29mdHdhcmUgd29ya3MgcHJvcGVybHkgb24gb3VyIHN5c3RlbXMuDQoNCldlIGRvIGhhdmUg
YW4gYWxwaGEgbG9hbiBwcm9ncmFtIHdoaWNoIHdpbGwgc3RhcnQgc29vbiBhbHNvLCBhbmQgd2Ug
d291bGQgbGlrZSB0byBzdXBwb3J0IGl0ICJwdWJsaWNhbHkiIGFsbG93aW5nIGl0cyBtZW1iZXJz
IHRvIHJlYnVpbGQgb3BlbmJtYyBhbmQgbGludXhib290IGltYWdlIGZyb20gY29kZSB3aGljaCBh
cmUgYXZhaWxhYmxlIG9uIGdpdGh1YiwgdGhpcyBhbHNvIGV4cGxhaW4gdGhlIHRpZ2h0IHNjaGVk
dWxlIHdlIGZvbGxvdy4NCg0KTGFzdCBidXQgbm90IGxlYXN0LCBJIGFtIHRyeWluZyB0byBhdXRv
bWF0aXplIGFzIG11Y2ggYXMgd2UgY2FuLCBidWlsZCBhbmQgdGVzdGluZyBvbiBIUEUgaGFyZHdh
cmUgdGhyb3VnaCBvdXIgcHVibGljIGludGVyYWN0aXZlIENJIHdoaWNoIGlzIHVuZGVyIGFjdGl2
ZSBkZXZlbG9wbWVudC4gVGhlIHRvb2wgaW50ZW5kIHRvIHRha2UgYXMgYW4gaW5wdXQgYSBnaXRo
dWIgcmVwbywgYSBicmFuY2ggYW5kIGJ1aWxkIGEgZnVuY3Rpb25hbCBvcGVuYm1jL2xpbnV4Ym9v
dCBpbWFnZSBhcyBhbiBvdXRwdXQgd2hpY2ggd2lsbCBiZSBhdXRvbWF0aWNhbGx5IHJhbiBvbiBh
IGxpdmUgaGFyZHdhcmUgbWFjaGluZS4gSXQgaXMgYXZhaWxhYmxlIG9uIGh0dHBzOi8vb3NmY2ku
dGVjaCBhbmQgaHR0cHM6Ly9naXRodWIuY29tL2hld2xldHRwYWNrYXJkL29zZmNpLiBUaGUgY29k
ZSBpcyBzdGlsbCBhIGxvdCBidWdneSwgYnV0IEkgYW0gcHJvZ3Jlc3Npbmcgb24gYSBkYWlseSBi
YXNpcy4NCg0KT25lIG9mIHRoZSBtYWluIGFkdmFudGFnZSBvZiBpdCwgaXMgdGhhdCB5b3UgZG8g
bm90IG5lZWQgdG8gYmUgc2VhdGVkIGNsb3NlZCB0byByZWFsIGhhcmR3YXJlIHRvIHRlc3Qgb24g
cmVhbCBoYXJkd2FyZS4gSSBoYXZlIGFsc28gaW5jbHVkZWQgYSBidWlsZCBtYWNoaW5lIHdpdGgg
YSBsb3Qgb2YgY29yZSBhbmQgbWVtb3J5LCBzbyB3ZSBjb3VsZCBiYXRjaCBidWlsZCBpbWFnZXMu
IElmIG5lZWRlZCB3ZSBjb3VsZCB0cnkgdG8gZmluZCBhIHdheSB0byBzaGFyZSBpdCBhcyBhIGJ1
aWxkIHN5c3RlbXMgaW50byBPcGVuQk1DIEplbmtpbnMuDQoNCkJ5IHRoZSB3YXkgQnJhZCwgZG8g
eW91IHRoaW5rIHdlIGNvdWxkIGNyZWF0ZSBhIG1ldGEtaHBlIGludG8gdGhlIHRyZWUgPw0KDQp2
ZWptYXJpZQ0KDQrvu79PbiA2LzQvMjAsIDEwOjU5IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2Yg
QnJhZCBCaXNob3AiIDxvcGVuYm1jLWJvdW5jZXMramVhbi1tYXJpZS52ZXJkdW49aHBlLmNvbUBs
aXN0cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiBicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+
IHdyb3RlOg0KDQogICAgT24gV2VkLCAyMDIwLTA2LTAzIGF0IDE5OjM2ICswMDAwLCBHYXJyZXR0
LCBNaWtlIChIUEUgU2VydmVyIEZpcm13YXJlKQ0KICAgIHdyb3RlOg0KICAgID4gSGkgQnJhZCwN
CiAgICA+IA0KICAgID4gT3VyIHRoaW5raW5nIGlzIHRvIHNldCB1cCBwdWJsaWMgZm9ya3MgImNs
b3NlIHRvIGhvbWUiIHRoYXQgd2UgY2FuDQogICAgPiB3b3JrIHJhcGlkbHkgaW4gDQoNCiAgICBU
aGF0IG1ha2VzIHNlbnNlIC0gbXkgZHJlYW0gaXMgdGhhdCBzb21lZGF5IGV2ZXJ5b25lIGNvdWxk
IHdvcmsgcmFwaWRseQ0KICAgIGRpcmVjdGx5IGluIHVwc3RyZWFtLiAgV2UgaGF2ZSB3b3JrIHRv
IGRvIHRvIGdldCB0aGVyZSBmb3Igc3VyZS4gICAgSWYNCiAgICBpZGVhcyBjb21lIHVwIHRoYXQg
Y291bGQgbWFrZSB0aGUgc2l0dWF0aW9uIGJldHRlciBwbGVhc2Ugc2hhcmUgdGhlbQ0KICAgIGhl
cmUgb24gdGhlIGxpc3QuDQoNCiAgICBJIHRoaW5rIGl0IHdvcmtzIGJlc3QgZm9yIGV2ZXJ5b25l
IGludm9sdmVkIHdoZW4geW91IGNhbiBjb21taXQgdG8NCiAgICB3b3JraW5nIGRpcmVjdGx5IHVw
c3RyZWFtLCBmaXJzdC4gIE15IG9ic2VydmF0aW9uIGlzIHRoYXQgaXQgaXMNCiAgICBleHRyZW1l
bHkgZGlmZmljdWx0IHRvIGNpcmNsZSBiYWNrIGFuZCBpbmNvcnBvcmF0ZSBjb21tdW5pdHkgZmVl
ZGJhY2sNCiAgICBhZnRlciB5b3UgaGF2ZSBzb21ldGhpbmcgdGhhdCB3b3JrcyBmb3IgeW91LiAg
VGhhdCBjYW4gbGVhZCB0byBwcm9ibGVtcw0KICAgIGxpa2UgdGhlIGNvZGUgbm90IGJlaW5nIGFj
Y2VwdGVkIG9yIGludHJvZHVjaW5nIGZyYWdtZW50YXRpb24gaW50byB0aGUNCiAgICBwcm9qZWN0
Lg0KDQogICAgQnV0IEkgdW5kZXJzdGFuZCB0aGF0IGNhbiBiZSByZWFsbHkgaGFyZCBhbmQgY29u
ZmxpY3RpbmcgaW50ZXJuYWwNCiAgICBidXNpbmVzcyBwcmVzc3VyZXMgYXJlIG9mdGVuIG1pdGln
YXRlZCB3aXRoIHRlY2huaXF1ZXMgbGlrZSB0aGUgb25lIHlvdQ0KICAgIGhhdmUgZGVzY3JpYmVk
LiAgTXkgY29tcGFueSBtYWludGFpbnMgZm9ya3MgdG9vLg0KDQogICAgT25lIGxhc3Qgb3BpbmUg
anVzdCBpbiBjYXNlIGl0cyBoZWxwZnVsIC0gbGlrZSBzZWN1cml0eSwgd29ya2luZyBpbg0KICAg
IHVwc3RyZWFtIGZpcnN0IGlzbid0IGJvb2xlYW4gLSBpdCBpcyBhIHNwZWN0cnVtLiAgV2hlcmUg
YW4gb3JnYW5pemF0aW9uDQogICAgKG9yIGEgc2luZ2xlIGRldmVsb3BlcikgbGFuZHMgb24gdGhh
dCBzcGVjdHJ1bSBpcyBvbmUgZWxlbWVudCBvZiB3aGF0DQogICAgc2VwYXJhdGVzIHRob3NlIHdp
dGggaW5mbHVlbmNlIG92ZXIgb3RoZXJzIGZyb20gdGhvc2Ugd2l0aG91dC4NCg0KICAgID4gYW5k
IHNpbXVsdGFuZW91c2x5IHdvcmsgdG8gdXBzdHJlYW0gcGF0Y2hlcyBmb3IgVS1ib290LCBMaW51
eCwgYW5kDQogICAgPiBPcGVuQk1DIHRvIHRoZSBtYWluIHJlcG9zLiAgDQoNCiAgICBHcmVhdCEg
IExvb2tpbmcgZm9yd2FyZCB0byB3b3JraW5nIHdpdGggeW91IGFuZCB0aGUgdGVhbSBvbiB0aGF0
Lg0KDQogICAgdGh4IC1icmFkDQoNCg==
