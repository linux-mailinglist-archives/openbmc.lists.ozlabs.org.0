Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD68C19EB
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 03:00:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hPFy6b0kzDqNw
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 11:00:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5176e83237=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="VzS/eXEy"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="GEzcd4eA"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hPFG0GDSzDqLx
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 10:59:41 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8U0wf6p003728; Sun, 29 Sep 2019 17:59:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=aMWTXewnDLFUqcb+s5VO1KnNwYpDj04Nf3sLLsxg+98=;
 b=VzS/eXEyWUBWHzRXEMUjIzbSoKPSgF2WzG7ptTIN2Oeo0xsuQp2DgIVPPE6oTefu048r
 8sJVl9ZZv82xxzbba7O3p9DerQfyiZXUHlb9IdfqZaL4h6QzWYMvSF/zmyG2jaNLx/ku
 L0sTXoAzuLJ623DLY1qmvFUAo5zMX1gXobs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2vaqu634jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 29 Sep 2019 17:59:32 -0700
Received: from ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 29 Sep 2019 17:59:31 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 29 Sep 2019 17:59:31 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 29 Sep 2019 17:59:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iA8c1xTDNLQa9oE1lxvaRWKOd4L4KJR0DbelUnCte4D+niZS1iw/VeBffRhk1vxjltQSOvpDrQdUhpVe4A6CamoTE6+XjaiMXKG40Embiltl631Ng5YgbIWV7BPm67AW+AGCKh/0wCyjK0Hvr3soQFS9UDBBubtjklh0mom0iFPdRzlYd1Fu0XAwTh+JRposMUXdn2GDGG4MsZ8va7C/oPfC7FEod8/loaeFBDyBifK4qtNIyNlF/Hss+j7V8E65Nd6lZ8aguYw5ypoRE42XiLhz6+3Dp8y4GUItrB2+JRuVGYLIPHSCjO6qLxPhUyWaQQkJstLkqbZOh433mcr61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMWTXewnDLFUqcb+s5VO1KnNwYpDj04Nf3sLLsxg+98=;
 b=bEf19G5N2zR0Mubt7mPcToGSRu/RRYWcFo6rrEjgkcFrJZ5g6l53cBkDbh9DLEW4o8QOwWsD1cHsTuPVSR9CYWq6VmdigNfcr7AEtxzaZblr9yhULXkUJl7lM9sQpMXIRv33b8xaG2zGW50IA2Qfl5w1PYFhywODhacdy3MRMrpUzgAfO1ug7BWKW9cEVH8TvqB9auoBpUQ7Zo22GZA450dpWCfhr2Z58fNQvK/rpIBa49jG+ybDZTvExJ3cQ+M5yhebjhZXKzfTsPt42tiTRaOOP3gWDJgIzhAlcakAQIzbXH0hL6Dln8H8O+VJQ/pIvhDSHPtU3zMj4Rylo4Vm2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMWTXewnDLFUqcb+s5VO1KnNwYpDj04Nf3sLLsxg+98=;
 b=GEzcd4eAv0tkJ0oBHW3NHvzBMvcoUmWCnh5tM1d0AktN9r69XyCmWYsC6jJf+yC0KTNVxAGAdym/Q+nkYfFJC4Dpla/yRmtHXl46d0Uw2cY6xmoYlRyE/TkRmx6dBZXkrkR05FU+69GVH9Syf7As3HMc5dSGMslRpSvdZjJ2uLA=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1662.namprd15.prod.outlook.com (10.175.140.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 00:59:30 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::21:6b1:4f7e:3669]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::21:6b1:4f7e:3669%9]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 00:59:30 +0000
From: Tao Ren <taoren@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: i2c-dev wrapper
Thread-Topic: i2c-dev wrapper
Thread-Index: AQHVdSuoEhEoEypmnUSWVSlVJD36RKdDakaA
Date: Mon, 30 Sep 2019 00:59:30 +0000
Message-ID: <7bbd7b65-9cb7-8ca5-4d60-51d48e8735d1@fb.com>
References: <E3DA1B69-7DA0-4E92-A6EB-BFBB7ADC50CC@fuzziesquirrel.com>
In-Reply-To: <E3DA1B69-7DA0-4E92-A6EB-BFBB7ADC50CC@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CO2PR04CA0128.namprd04.prod.outlook.com
 (2603:10b6:104:7::30) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:180::181c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83595b05-1d07-472c-3554-08d7454172e0
x-ms-traffictypediagnostic: MWHPR15MB1662:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR15MB1662394F43CFB7760E2BCF8FB2820@MWHPR15MB1662.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:619;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(376002)(136003)(366004)(39860400002)(189003)(199004)(256004)(11346002)(7736002)(486006)(76176011)(966005)(476003)(6506007)(102836004)(229853002)(46003)(2616005)(65806001)(65956001)(86362001)(386003)(53546011)(31696002)(305945005)(446003)(186003)(478600001)(99286004)(52116002)(25786009)(5660300002)(14454004)(4744005)(31686004)(316002)(4326008)(36756003)(8676002)(6436002)(2906002)(6116002)(58126008)(110136005)(6246003)(71200400001)(71190400001)(66446008)(6486002)(64756008)(66556008)(66476007)(66946007)(6512007)(81166006)(6306002)(81156014)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1662;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c13oI+4RonmQd5xKRxE65ss4LxwdQZdDoqizKfVpoXBU81ElGI5X3ABoVbl/kzhjBMBaGNl8RlCQi5WfTzr+VQvWGZFlgK3D8KcltOKtBOGKUiZPRbCzsr0lI9AHkPHv9KlBsGKMuLQFjjKn2OykXlTyO7Cvu8wKbtJ9K5x52MYUqkQX4MlPZYSotgdmcV3za8DKRyVNvwWaVmtugzWRxBVWgns16G7XutndFudY0ZO5yRIAxJ2f+RGiO7u/N8LUBpw0n4miruMpcZ/z0hbCksA3Js/YE3ssGYU6iLc4tR6h0Zrnu5isK+i08OtuVtxSba8TMUhrFrFYDwxz31KPZsR7qkuab+WTkAG/6Vddk3fob8I6u69tCKLRKIeyaioiWmGbAtPnrFMPAs7LrnVovxCeTR70CrFZcpNCYf9svrLbLPi5qONZllE4kgBJr0iMqlVRGNWkZGYwIrLfZJC/mQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB1CFB001C6CA147AE89A28C8B5210B8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 83595b05-1d07-472c-3554-08d7454172e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 00:59:30.2180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LA6VXxRCrXL7b4CzUnbcrURpxGuTNX4IMB1ExaDgyyWl2eq7TaEH4R7roHpnlyzS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1662
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-29_15:2019-09-25,2019-09-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=647
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909300009
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
Cc: "shawnmm@linux.ibm.com" <shawnmm@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gOS8yNy8xOSA0OjU0IEFNLCBCcmFkIEJpc2hvcCB3cm90ZToNCj4gRG9lcyBhbnlvbmUgaGF2
ZSBhIGZhdm9yaXRlIGkyYy1kZXYgQVBJIHdyYXBwZXI/wqAgUHJlZmVyYWJseSBidXQgbm90IG5l
Y2Vzc2FyaWx5IGluIEMrKz8NCg0KaTJjLXRvb2xzIChiZWxvdyB1cmwpIHByb3ZpZGVzIHNldmVy
YWwgZWFzeS10by11c2UgQVBJcy4gTWF5YmUgeW91IGFyZSBsb29raW5nIGZvciBtb3JlIEFQSXM/
DQoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS91dGlscy9pMmMtdG9vbHMvaTJjLXRv
b2xzLmdpdC90cmVlL2luY2x1ZGUvaTJjL3NtYnVzLmgNCg0KDQpDaGVlcnMsDQoNClRhbw0K
