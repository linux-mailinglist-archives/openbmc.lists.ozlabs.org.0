Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 910BB812B6
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 09:05:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46280h2V2rzDqVk
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 17:05:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3120bdbce4=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="aVcpx4DF"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="jamKV4/s"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4627BK4BVGzDqS3
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 16:28:24 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x756P5bo012038; Sun, 4 Aug 2019 23:28:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=C5cBMLzZhwm9Jm6TDXTtHXtS6wAx2QKAExptt9KEHMs=;
 b=aVcpx4DF0SCQ20nTr3kHirxe9gJU452UKLofp8MmLc4PoDFkd5OuMTw1wNHfGjgPx/DM
 /D0A0zNdaZ88u/8durdX3w1Kd5QUtLQTcrS0orDwZO2i295HxEh7BcTUwH5TasmRrfl5
 7tJFThKM/dxk05+uVg1T6j6mnuNGmqJf42g= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2u5s4kjnbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 04 Aug 2019 23:28:17 -0700
Received: from ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 4 Aug 2019 23:28:15 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 4 Aug 2019 23:28:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1eIFkFYSko48Ecdmw1TGftqlONAzZK0NXT0kpB3IUpeGVVC5wSVLHsKwDjc/EW6fepWZT4sRV0s9xHDTPrl/FJyYmCN2dZY9sxy8sFEUXLNVylNbuK3Gf1ylUOWot9DL6neY7OsxP6LLhvfXZBBD1tmTNgMBs6tM/b9xlOZN90nZLBqV/CmjkZflLPvAsoWLKWozpOmBe00UPjiZxesOEVHFR0TmEXMdM+AWG4Nd19nT5GgxZH2LziUsqV5Wt5zCZyGcwxBv9R5xqs6z8qI2lUTIlvPf7NG5+MGia//GzZ9trFrFiUyPONxgVl3xFVClOgRPNxobYxu3CS/KY9PSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5cBMLzZhwm9Jm6TDXTtHXtS6wAx2QKAExptt9KEHMs=;
 b=kkN2NBhab4SGFGSHxLp6THcH+FbY/2wlxOl54bjzjQf2psRNDs4vrLxILrRuVUuSZo+g5xs353BbCSjT3oQ/oIJMekKZeT+KRaXhWwSgg/DTUAXdvaPph5amV3hU7N5/ac5Zi3uZVPZAvANZAsuKj/yTYSvGRwmPhxkfq1Kig4XllhXYI69HpgHvC3gkPcJUEYrmj6o6tNS3IVVB1gIzE2oHQ1ISwUlZgoh9l+G9ukZGHMmmWL3Xpcb5wtIHaJOv8FjbmdALoAC/JoAv3E+vTa5NgdaQj3bkiai7MX8Zs3fom81L/oDJxcJ3czP8F6/+cUWLcn5nqG2NTIfFAN4P8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5cBMLzZhwm9Jm6TDXTtHXtS6wAx2QKAExptt9KEHMs=;
 b=jamKV4/s2k/lUS8zNkb/7Kq2K8KWgxaLYfoJ+dTa8CDZaIhF/m93u2QJDSnFfoE6YAb3QJmYMKaiUOr2HB6l17FKGk8pNCWoQRZgkdSSW3n5gGtqbIAn4JS0eQVGSa05qwgEe6s6A9qIkwn/HJz+eJmMQeJrvHPpN3pJiAM8VsY=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1469.namprd15.prod.outlook.com (10.173.233.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 06:28:14 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc%2]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 06:28:14 +0000
From: Tao Ren <taoren@fb.com>
To: William Kennington <wak@google.com>, Samuel Mendoza-Jonas
 <sam@mendozajonas.com>
Subject: Re: Calculate BMC MAC address from NCSI NIC's base MAC
Thread-Topic: Calculate BMC MAC address from NCSI NIC's base MAC
Thread-Index: AQHVSK4qEQp9fTkZYki4gxm4espglabr+4CAgAAOloCAAADIgIAAEa4A
Date: Mon, 5 Aug 2019 06:28:14 +0000
Message-ID: <c2a436f0-714e-f68f-12fb-e04b921ddb87@fb.com>
References: <2819fa0b-82a2-0103-1451-6a41a9410339@fb.com>
 <CACPK8XcVdNMoksCc0OucgLw2-b7MWTNMyWwww-1=o7anC230sw@mail.gmail.com>
 <4f6cb0a1c1fdc3aec683b31aeb9e53b4a54266b2.camel@mendozajonas.com>
 <CAPnigKn8mVnSXsCY+k+cQuEO2QKSDD3Ju7zfT_a0RyJQ0W_ZYw@mail.gmail.com>
In-Reply-To: <CAPnigKn8mVnSXsCY+k+cQuEO2QKSDD3Ju7zfT_a0RyJQ0W_ZYw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR12CA0059.namprd12.prod.outlook.com
 (2603:10b6:300:103::21) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:180::7ac7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db003d96-7fee-4dfd-27d3-08d7196e184e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1469; 
x-ms-traffictypediagnostic: MWHPR15MB1469:
x-microsoft-antispam-prvs: <MWHPR15MB1469052C2A17DBEEAAA562FFB2DA0@MWHPR15MB1469.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(396003)(136003)(346002)(376002)(189003)(199004)(2616005)(476003)(53546011)(186003)(6486002)(8676002)(102836004)(46003)(58126008)(7736002)(316002)(305945005)(110136005)(446003)(11346002)(54906003)(52116002)(4326008)(76176011)(65826007)(99286004)(86362001)(14454004)(31696002)(36756003)(486006)(68736007)(64126003)(386003)(6506007)(25786009)(31686004)(53936002)(71190400001)(478600001)(6246003)(65806001)(65956001)(2906002)(229853002)(256004)(81156014)(5660300002)(81166006)(6436002)(66946007)(66476007)(64756008)(6512007)(8936002)(66556008)(4744005)(66446008)(71200400001)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1469;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TFWnDZG8BUeJZhqCIvleVk/6hFTN0/gawH2opYdmvS/ugsctctwjmQhsp7PNttcx+MXCbw84NsPOII1oibfNdlRzIGstiQAkayGbndvKWy//Jyx4FC8Gfmu3zdTE3dal5/gszNGtJxNOAe0RHYNV1DhbY60C4h+EXCIkr/ijjTizlgTItvyLQUN5tCUgkHPpzTYOePzLBNgjuoJhiE8yRPg3EA9LdXxSkySWlVITRVEHDNH03xBeuJtfW87VR1qb3UZpqjXwaXbaWc3k6AMqiB7DXyZTmCQhITmIoBSWVyuhbAdG7D2Vtt1ttWygPyNL+0dUaOCJYMZSM51899V/bsdAjRjb5lQMKQFbP/W7sLWff0abHewH729xnaxrcQdpgF+7lZfnU8BEbNjTBapBnwUYRS2b5Tjy+deBRId++nM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF5BCACA099FA44B85ABDE686FB834CD@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: db003d96-7fee-4dfd-27d3-08d7196e184e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 06:28:14.2915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1469
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-05_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=867 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908050072
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
Cc: OpenBMC
 Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gOC80LzE5IDEwOjI0IFBNLCBXaWxsaWFtIEtlbm5pbmd0b24gd3JvdGU6DQo+IFNvbWV0aGlu
ZyBhbG9uZyB0aGVzZSBsaW5lcyB3b3VsZCBiZSByZWFsbHkgbmljZSBmb3IgdXMgc2luY2Ugd2UN
Cj4gYWN0dWFsbHkgc2hhcmUgdGhlIHNhbWUgTUFDIGFkZHJlc3Mgd2l0aCB0aGUgQk1DIGFuZCB0
aGUgSG9zdC4gU28ganVzdA0KPiBiZWluZyBhYmxlIHRvIGNvbmZpZ3VyZSBhbiBvZmZzZXQgb2Yg
MCB3b3VsZCBiZSBwZXJmZWN0IGZvciBvdXINCj4gdXNlY2FzZSBpZiB0aGUgcmVzdCBvZiB0aGUg
c3RhdGUgbWFjaGluZSB3b3JrcyB0aGUgd2F5IHdlIHdhbnQuDQoNClRoYW5rcyBXaWxsaWFtIGZv
ciB0aGUgZmVlZGJhY2suIEkgZGlkbid0IGtub3cgMCB3YXMgYSAidmFsaWQiIG9mZnNldCwgd2ls
bCB0YWtlIHRoaXMgaW50byBjb25zaWRlcmF0aW9uIGluIG15IHBhdGNoIDopDQoNCg0KQ2hlZXJz
LA0KDQpUYW8NCg==
