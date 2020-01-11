Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C083137AE0
	for <lists+openbmc@lfdr.de>; Sat, 11 Jan 2020 02:14:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vhj76fW8zDqkL
	for <lists+openbmc@lfdr.de>; Sat, 11 Jan 2020 12:14:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8279e5572e=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=qp8Wu09f; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=fEl9Q9Uo; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vhhP3vtBzDqdW
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jan 2020 12:14:06 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00B1A2Oc026290; Fri, 10 Jan 2020 17:14:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=9JePUcnKJgc2YsFYRoRK/qNNuic8J+imM67BNNkL0lw=;
 b=qp8Wu09fM77uU1XSzEpH4eyjnUYlnOtssTjreciMGrvyIOQFuT4Vcy5YSJJVctQy+77k
 fFr0gWB5TV6G2OIYC7IZ/rHkG+D8ggdz76W4dU0w240ZONxEs2+TJv0HhJDig/9q1PXc
 0KDlpo4qhtQjHCS2o5cjGJDutBUxAn5A/Ok= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2xeuvwbg6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2020 17:14:01 -0800
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 10 Jan 2020 17:14:00 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 10 Jan 2020 17:14:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEXTaeh4+fcMS4Z+OnZccjl/7f0hQMXJ3D93aYW/7FVJtQ/lhbg+jmtuUVxCHNCX4fMEqwTn0LbjdJtMiKq5CkEr2tQRlHfnrnu6b00ruKoPS7znWltxDt7XN/m6CBfto+Es+egK9jRHywgWaTsjNSkZ+j/pi0q4KtyQL6JPR8kvttBQa2DjcS78GPuQDCKolMd3EJBdO0E+PYX5GzUea/FZXoJnoxBhg33UQfWxjNxlH+9R0ywrD6u/DwbIMSJyTBlor2nkfuc4gEHWYUzPpmePwfbYF9tS2Xq1kpidQ3+3A1n73BKBD61BjQr3wvCz2wF/183OUSSyQ3/FrHM5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JePUcnKJgc2YsFYRoRK/qNNuic8J+imM67BNNkL0lw=;
 b=aesbwjlOrUDYauuSxOu1cw02gEw8XEn/fAnnmBzFfrFtAgNwkgoNn35soHbfljyAJZnINuLFtiL3bzCv5rTlKc2DTTcY1Bg7ruYXp1+eIFmIEOVGEOYH9QH6h988x3Qz8/f+z6DUBHZkMWHWg4XeaYljICCHGC4OzHDpetL9N3u+G1NS/bZzxGFHNt2eLmiqrBvcbRC6YJoRv0ycz0mmD8b5w8K5F5zLdRe5zMu9IL3eA3RxQoHROj+SWYIDcTzFuyCU8aRcDdicjoyqo7xXjSfe+nMP9EwbSM0Vzhshax2rM3MWLz4bYWJZiLoZrH2xJcwwgzEwzgF8MpW80akiVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JePUcnKJgc2YsFYRoRK/qNNuic8J+imM67BNNkL0lw=;
 b=fEl9Q9Uon6mw53YwOQ5zUMUgwVOoo/sxNPEyF78MJEiRH8SpyZYhHAKdWs+w7NQPtlBRGmH3FYf7zK84GgTJdMNpTv611rZ05Y5ycrXgF7vOfLZj15UMVyrb8MwUQl29eBnhkhbuNrEv3zM695k4UZou6FwET45/SXT7LRHQaLs=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1776.namprd15.prod.outlook.com (10.174.96.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Sat, 11 Jan 2020 01:13:59 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2623.011; Sat, 11 Jan 2020
 01:13:58 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [net-next PATCH] net/ncsi: Support for multi host mellanox card
Thread-Topic: [net-next PATCH] net/ncsi: Support for multi host mellanox card
Thread-Index: AQHVxn2QUFjYVaSmN0a5L6zvE4MlVKfjMJSAgAD1IQA=
Date: Sat, 11 Jan 2020 01:13:58 +0000
Message-ID: <8C9F6A65-E1E5-49FE-83B3-CF69CFCC53AC@fb.com>
References: <20200108234341.2590674-1-vijaykhemka@fb.com>
 <20200109.183637.755651104106589448.davem@davemloft.net>
In-Reply-To: <20200109.183637.755651104106589448.davem@davemloft.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:70aa]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e615605-8603-442e-1e56-08d79633896d
x-ms-traffictypediagnostic: MWHPR15MB1776:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR15MB1776ED22FA6C2AB22BCCD339DD3B0@MWHPR15MB1776.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0279B3DD0D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(366004)(396003)(39860400002)(136003)(189003)(199004)(8936002)(81166006)(8676002)(81156014)(4326008)(86362001)(36756003)(64756008)(316002)(66446008)(66476007)(66946007)(66556008)(54906003)(478600001)(33656002)(186003)(5660300002)(6506007)(76116006)(2616005)(6512007)(2906002)(6916009)(6486002)(4744005)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1776;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 77iqKrWCgzH/IoH0Ulpo08azPpgYYFvygNl4trxLWDCDy5ORmKNrorigFRxirPr0rk8NzpcOUjgFJrWrSBHDfT7Y3MQ3AUaGGR35hzLKauVMXrI2McqKlOAPW2PHXkGSIOswWPCaD/nPDURt4VBurrp8i+w2YwmnAnIszYZwIzNPHoJbcYaKBdTLUnugf9qIvtRXkuXCHdsmQZFxLfUzCoT5ZgDa4RqZqCF0bn5TIk1ZyYUhiDEKMFK95Suxc10ZzWpWcL98p/1eQoyidPmxNvwPCKcUZJSHyhYEBBhzGW8saiyUJPkhw3jN9WHdXEQJ5lSSev4svD4iGPcsYvwyaYIGmsbQP3+veBF3WNBRlmKoymToOp7FisAk+NkW6SZKHerJ0Hf9ryNodS65WQBclOPsamFGMCDrUSxdC9kQKn7DCYUinWwJXFmKuAufEWft
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0E4D48E59034947B5B61B824E5A32E6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e615605-8603-442e-1e56-08d79633896d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2020 01:13:58.7703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qekzpvMoyst9u5wAFS8bV65UmDttPZtBFKsfuYVqj2t14gwptU4qPhv5Ktigg1kkkHV66+xQOtgVpEX8FmkZEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1776
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-10_04:2020-01-10,
 2020-01-10 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001110006
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sam@mendozajonas.com" <sam@mendozajonas.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDEvOS8yMCwgNjozNiBQTSwgIkRhdmlkIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9m
dC5uZXQ+IHdyb3RlOg0KDQogICAgRnJvbTogVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5j
b20+DQogICAgRGF0ZTogV2VkLCA4IEphbiAyMDIwIDE1OjQzOjQwIC0wODAwDQogICAgDQogICAg
PiBNdWx0aSBob3N0IE1lbGxhbm94IGNhcmRzIHJlcXVpcmUgTUFDIGFmZmluaXR5IHRvIGJlIHNl
dA0KICAgID4gYmVmb3JlIHJlY2VpdmluZyBhbnkgY29uZmlnIGNvbW1hbmRzLiBBbGwgY29uZmln
IGNvbW1hbmRzDQogICAgPiBzaG91bGQgYWxzbyBoYXZlIHVuaWNhc3QgYWRkcmVzcyBmb3Igc291
cmNlIGFkZHJlc3MgaW4NCiAgICA+IGNvbW1hbmQgaGVhZGVyLg0KICAgID4gDQogICAgPiBBZGRp
bmcgR01BIGFuZCBTTUFGKFNldCBNYWMgQWZmaW5pdHkpIGZvciBNZWxsYW5veCBjYXJkDQogICAg
PiBhbmQgY2FsbCB0aGVzZSBpbiBjaGFubmVsIHByb2JlIHN0YXRlIG1hY2hpbmUgaWYgaXQgaXMN
CiAgICA+IGRlZmluZWQgaW4gZGV2aWNlIHRyZWUuDQogICAgPiANCiAgICA+IFNpZ25lZC1vZmYt
Ynk6IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPg0KICAgIA0KICAgIEFwcGxpZWQs
IHRoYW5rIHlvdS4NCg0KVGhhbmtzIERhdmlkLg0KICAgIA0KDQo=
