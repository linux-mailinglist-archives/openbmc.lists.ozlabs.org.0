Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4F181A8
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 23:34:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zqVb2xnzzDqNK
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 07:34:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=003117c9a5=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Am5PDq4I"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="E0b/R7V7"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zqTk1yYyzDqCb
 for <openbmc@lists.ozlabs.org>; Thu,  9 May 2019 07:33:28 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x48LWXNZ014576
 for <openbmc@lists.ozlabs.org>; Wed, 8 May 2019 14:33:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=3Dy7We5erB4/BtoXzi8Lydo5Eodd56Ovjd62MeX0e0k=;
 b=Am5PDq4ICMC1kNTVBT4t+GBFt1j7xsDgBB6Y2oRD2vKA52cQzqQbhkVWuzS+4kyIwiJ8
 LDnVqKYAclVxIkmUbLvh06ZDPcBFEbRspj1SpeWQhKc4ps4Li/nr+/PRwoz1Ej1yQNFT
 zXQ28N2Wt2xM5hoRjyv5/NmLehrFLtixGFY= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2sc05qsqx6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 14:33:25 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 8 May 2019 14:33:24 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 8 May 2019 14:33:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dy7We5erB4/BtoXzi8Lydo5Eodd56Ovjd62MeX0e0k=;
 b=E0b/R7V7pjSLHCx2DChTLWZ2WZXFG98uk0Ci/8QS0CRXfZLHC4f7GnMVZqjpscWKIhbmWmWFDGLtAGn452PPMZbETOQBg/q3CM/bu0Bscls2u8vq4mf4ntDhxD+OmvBqUfVFIX79ZRCLSHk8F7SfNh4DgqNIErCjDN1DFYC5Ow0=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1776.namprd15.prod.outlook.com (10.174.255.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Wed, 8 May 2019 21:33:22 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ada9:e958:5d54:7a9c]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ada9:e958:5d54:7a9c%9]) with mapi id 15.20.1878.019; Wed, 8 May 2019
 21:33:22 +0000
From: Tao Ren <taoren@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Moving kernel to 5.1
Thread-Topic: Moving kernel to 5.1
Thread-Index: AQHVBXhLJc6qMqat9UCOinZkOdit06ZhwFwA
Date: Wed, 8 May 2019 21:33:21 +0000
Message-ID: <34f956d3-d35b-63f2-562a-ed35df6107d3@fb.com>
References: <CACPK8XeSFx7LUKch3Vy+OVKaV=3P4UVWOXBkUF0WO3iKx47NVw@mail.gmail.com>
In-Reply-To: <CACPK8XeSFx7LUKch3Vy+OVKaV=3P4UVWOXBkUF0WO3iKx47NVw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0011.prod.exchangelabs.com (2603:10b6:a02:80::24)
 To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:47c2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ad1f259-bcac-47d9-d6b6-08d6d3fccb4f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MWHPR15MB1776; 
x-ms-traffictypediagnostic: MWHPR15MB1776:
x-microsoft-antispam-prvs: <MWHPR15MB1776BA6A98069C47A7159A23B2320@MWHPR15MB1776.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:446;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(346002)(136003)(39860400002)(396003)(189003)(199004)(486006)(476003)(6916009)(2616005)(229853002)(66476007)(66556008)(64756008)(66446008)(102836004)(386003)(6506007)(76176011)(53546011)(66946007)(73956011)(31686004)(305945005)(7736002)(52116002)(5640700003)(6512007)(71200400001)(6436002)(71190400001)(99286004)(256004)(6486002)(14454004)(6116002)(65806001)(65956001)(446003)(316002)(58126008)(68736007)(64126003)(478600001)(5660300002)(25786009)(36756003)(4744005)(46003)(7116003)(81166006)(81156014)(53936002)(1730700003)(65826007)(2351001)(2501003)(11346002)(6246003)(8676002)(8936002)(31696002)(2906002)(86362001)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1776;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UV+WEK/bHLZkUGFf80cYWZyKPsAQFd1hNNvVZyRNG0kNX9t8B3IHp7epc9bRwivJdfVhVAfOp59ru12qfgRDGL9tVg4zSqSS/Zw7GG79YAnIpIXv5y/4FnSqWYJSkk8BAhd2DAmyOEiQx1huHltCo+jdgDtacLQQnHLVDSnEatWQGNZOMUa7GOD81018r/pKKBVN8EM5cTOxhuv5H3lTEXbSAG48k1h+imsViMynfIOnfXgA3cGEvxVldAGAjhR6nFZvyNkjYkZb3mUCRj6tZCltvw84Tup9DlHMjrdtDUe0WxOmDJX4ASBzifquZ3fp3FMDfUyUO5YYuRxpeId5wlkuY7PdeLwhXP21PSKSHQw4P/HAfCpYVBIyTin1sGW7IPkTz+TlEFq9k8zdP50gJRuunsZ2hoUav3YO3HotolY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A347D7D823C8354497DDEA0E40CA60AA@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad1f259-bcac-47d9-d6b6-08d6d3fccb4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 21:33:21.9413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1776
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-08_12:, , signatures=0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gNS84LzE5IDE6MjkgQU0sIEpvZWwgU3RhbmxleSB3cm90ZToNCj4gSGVsbG8gT3BlbkJNQyBk
ZXZlbG9wZXJzLA0KPiANCj4gTGludXggNS4xIHdhcyB0YWdnZWQgYSBmZXcgZGF5cyBhZ28uIEkn
dmUgcmViYXNlZCB0aGUgb3BlbmJtYyB0cmVlIG9uDQo+IHRoaXMgcmVsZWFzZSBhbmQgcHVzaGVk
IGEgZGV2LTUuMSBicmFuY2ggdG8gZ2l0aHViLg0KPiANCj4gUGxlYXNlIHRha2UgYSBsb29rIGF0
IHRoZSBidW1wIGNvbW1pdCwgZ2l2ZSBpdCBhIHNwaW4gb24geW91cg0KPiBoYXJkd2FyZSwgYW5k
ICsxIGlmIGl0IGxvb2tzIGdvb2QgdG8geW91Og0KDQorMSAoYm9vdGVkIHVwIEZhY2Vib29rIENN
TSBhc3QyNTAwIEJNQyBhbmQgbm90aGluZyBsb29rcyBvZGQgdG8gbWUpLg0KDQpDaGVlcnMsDQpU
YW8NCg==
