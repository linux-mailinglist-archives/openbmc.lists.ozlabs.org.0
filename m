Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC335D7D7F
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 19:23:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t2Lw00ZCzDqv3
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 04:23:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5191125d25=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="BGDS9Agl"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="P0Prn2rf"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t2L66LSWzDqR5
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 04:22:21 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9FHHEDI004654; Tue, 15 Oct 2019 10:22:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=po3EMdPoWAFzUKll5g695lqUq/IRUjqQTrkCscDC6/8=;
 b=BGDS9Agl0onfD2SinujVCPJ6zhkH8LvF+cqCyeCDNnWlAmVpy5yMDOfaolSmvZE7458X
 oL391iBAYYYSP26V4dUwbBVKygR0RA0m9MEv01dhHR6MPD5cKHd93ARytN80m/4yeaxb
 XMY0t6oW1pwCg19iWtmbrvE4KZWE0Rws5eA= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2vkxgetxat-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 15 Oct 2019 10:22:18 -0700
Received: from prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 15 Oct 2019 10:22:17 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 15 Oct 2019 10:22:17 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 15 Oct 2019 10:22:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHGXzcag/Jg6cpUwTxN+XLEIB3vKCw+qSM6tWZd4J2tldNSblaL7eAvLRwduN13BaDmyIZEbVRdUtW2p9lgl5nmARZCQf3IyocRBloM4EODftugTlZnywKOjVxuz2umM3KNoDOGwdYiPxeKQE1FQElFZ2ijxNOW7z7QvnsVJEYPDDgn+7JO8/hqOr4eEoYjrWPg0x+bIiNoSDO30cZypPd7ySKE9rqIL/rD35SWxcAXXtFOmOduiwVIb+72tGxeO92h8jCit3/Oq7/bhkpDz/IIZYb2TdjQXgTb0IKw1GO7gJe9E02pLEhOt5MC5nbUnr2ajtYTV7ihvoEz4ukH32w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=po3EMdPoWAFzUKll5g695lqUq/IRUjqQTrkCscDC6/8=;
 b=iKYip5ERtDGiHrESOntOtoQ32/us8kEZgC2/l2+DDKo3oYO/VeRAXJ9KFlyrRyLzbhQ9LIp8qFeE9pDeev+YO7DqTvj78kqD6CWYslZ9ohyrB/u4C38eKpZ0sG2HgDxLC7hNfV8HJOnvCJbp1E8lZXSBzSu3wVR/eCeBk0pv0uffOBqzOrODbJjC/3OqlQo42jL3G6Bm7drQwhXK6erjPQZ9h5yPyvX7tuESJjYbfd7sKKPLKDAx7JFDsPXxGdslPJVURJjBl1DrbNO3UkajuDBrnPwkdtys28uGcHjmrP7tph8tPIE8zvnLokD1ShKRCw7UzN59UzbEK7jMy/LutQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=po3EMdPoWAFzUKll5g695lqUq/IRUjqQTrkCscDC6/8=;
 b=P0Prn2rfAzrkgGE3OHI5wa6T1VhN9gd9bvHwr28w81b0dbalVfNpbKqmfGpryap4ekxk8Voi1n/+0neyNs3ZzS073hJp26fad1uQRckHRBSjwmACs2u+OtAheQkaILm/VR6RHsh4vCu19KYFCL08JSTEOUJQZkXC6jZs8wEBYuI=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1215.namprd15.prod.outlook.com (10.175.3.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Tue, 15 Oct 2019 17:22:15 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246%10]) with mapi id 15.20.2347.023; Tue, 15 Oct
 2019 17:22:15 +0000
From: Tao Ren <taoren@fb.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v8 2/3] net: phy: add support for clause 37
 auto-negotiation
Thread-Topic: [PATCH net-next v8 2/3] net: phy: add support for clause 37
 auto-negotiation
Thread-Index: AQHVZ1Bi3JE3p3zeEkCydFApWQwsCKcrP8IAgDB0zoCAAHZqgIAAAI+A
Date: Tue, 15 Oct 2019 17:22:15 +0000
Message-ID: <4ea151a9-5746-3529-a50b-158b15580a52@fb.com>
References: <20190909204906.2191290-1-taoren@fb.com>
 <20190914141752.GC27922@lunn.ch>
 <61e33434-c315-b80a-68bc-f0fe8f5029e7@fb.com>
 <20191015.132013.246221433893437093.davem@davemloft.net>
In-Reply-To: <20191015.132013.246221433893437093.davem@davemloft.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR14CA0050.namprd14.prod.outlook.com
 (2603:10b6:300:81::12) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:5adb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13a327be-9c03-4c71-bc0e-08d75194391d
x-ms-traffictypediagnostic: MWHPR15MB1215:
x-microsoft-antispam-prvs: <MWHPR15MB1215212EEB9C0C537A78BC21B2930@MWHPR15MB1215.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(396003)(39860400002)(136003)(366004)(189003)(199004)(102836004)(476003)(31696002)(5660300002)(305945005)(81156014)(478600001)(66476007)(66556008)(14454004)(99286004)(66446008)(4744005)(7416002)(71190400001)(71200400001)(76176011)(186003)(7736002)(64756008)(65806001)(52116002)(66946007)(386003)(6916009)(6506007)(53546011)(486006)(256004)(6512007)(8676002)(81166006)(65956001)(2616005)(54906003)(11346002)(8936002)(6436002)(6116002)(6246003)(2906002)(4326008)(31686004)(86362001)(58126008)(36756003)(46003)(25786009)(446003)(6486002)(316002)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1215;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nwD+PRpp+0DVqbUAVe+lG+DdIQUlPdzhS7u/Kq5/kKjAiuQbTyIbcB+wY4BldD86STZAy1ZnpVUJ/ZchdrbIrZtxpoCsF5wFgfkCUBNVMBpMto3LUwJRPa1SU4g9caaP/HUpUWZ171rtxKDG/vNXqBL7yAiRR2cUywYna3w8MI8rWUwWughy4Utyk/iNNrqaRyxECwJ7qKGp4MbQzZvZ2AkNyvbIU0e/gYyCyQKDJiZXAVZc8IvIjrOVjzbb+BzyaddxFzIT5yNrefU9O7kLISLyENg7csBbaGz0MObsmpgeQrd8uUNgYHK8//AwV06lmxgSeadjci1oLDCA5PTkc7gK3nITfcPSrHMESDiZ8WilbNj+X5KjazbJKcvIY6L1KJhCCL2mFxvE9FpiUKeNJOtwIlfcqYoUONsrgxzmoPk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <95D2FB25DE850B40BA080794BAD52EE3@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a327be-9c03-4c71-bc0e-08d75194391d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 17:22:15.3243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fK7fwbnSfSB9el6paJ0TVTYCpTLolC/vblGlt3qIW01cUwn7hE6gVwWTNzxHHbXZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1215
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-15_06:2019-10-15,2019-10-15 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910150148
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
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "arun.parameswaran@broadcom.com" <arun.parameswaran@broadcom.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "justinpopo6@gmail.com" <justinpopo6@gmail.com>,
 "olteanv@gmail.com" <olteanv@gmail.com>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gMTAvMTUvMTkgMTA6MjAgQU0sIERhdmlkIE1pbGxlciB3cm90ZToNCj4gRnJvbTogVGFvIFJl
biA8dGFvcmVuQGZiLmNvbT4NCj4gRGF0ZTogVHVlLCAxNSBPY3QgMjAxOSAxNzoxNjoyNiArMDAw
MA0KPiANCj4+IENhbiB5b3UgcGxlYXNlIGFwcGx5IHRoZSBwYXRjaCBzZXJpZXMgdG8gbmV0LW5l
eHQgdHJlZSB3aGVuIHlvdSBoYXZlDQo+PiBiYW5kd2lkdGg/IEFsbCB0aGUgMyBwYXRjaGVzIGFy
ZSByZXZpZXdlZC4NCj4gDQo+IElmIGl0IGlzIG5vdCBhY3RpdmUgaW4gcGF0Y2h3b3JrIHlvdSBu
ZWVkIHRvIHJlcG9zdC4NCg0KR290IGl0LiBMZXQgbWUgY2hlY2sgYW5kIHJlcG9zdCBzb29uLg0K
DQpUaGFua3MsDQoNClRhbw0K
