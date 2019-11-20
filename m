Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F261034A2
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 07:54:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HtjQ6WkKzDqtW
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 17:54:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=6227b5757c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="q/bUjUxc"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="X2wtiilR"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Hthb4Q7tzDqBW
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 17:54:06 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAK6rpIh009334; Tue, 19 Nov 2019 22:54:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=uXpaA18Q62l9MLdueUryI2mFXL4XapDs/Iumh++Lekc=;
 b=q/bUjUxcRgoa517V5hzFgQmDADYjevOT1l4jJGs8p8gsF2QxgPrvmbc/5rO16Gd9BhGU
 04y5lWoXg75+beHJjCh6GtbqOLR5SZ9UrtaZE7lGNXKgT3f58WDBC7p7XMyYHw47A007
 pw3kO2cCkZNyWDtwYhNfDmJAPqwmjZNUW5Y= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2wcm54kq80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 22:54:04 -0800
Received: from prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 19 Nov 2019 22:54:02 -0800
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 19 Nov 2019 22:54:02 -0800
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 19 Nov 2019 22:54:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZG0kdz1BE1LasSa5MWSxrng7nw5Ek4gIfagPC1FTk2fNUbsI0QjbyNZRN5aPguP51xcwRMSDSuJaj9X4rnZJpAuE6/nfdKrITUEsuXMamlN0LWdaIiCtwJbePU+t90mWASOPE2IECJRrQk5ulXu67jW4IO3GOCGS7o63syHAjODhVQsxFz72brx2qndRHFAGzo/n/M5OdsPFmLRkhIDciaubOVXlE2DfEMEscaeWVxuTNaBxBwTfizgzKCM2Hl8NZZanJW9NF7nLCvrBVhnUFxXF1SIQtaf76+df0LiAcqXjjKayc2jXVFjOIktZCKHnV39/1adZlRjfyY7rrC1XiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXpaA18Q62l9MLdueUryI2mFXL4XapDs/Iumh++Lekc=;
 b=In2m1dlJRS+9bfxYR7BeKkogtFJI/QDQ1hfRxmoGZ4S6nSc3Rq2ctGsOShJa3lT9PhboUp1NhLKYou63F4GrfmrVYpnSJY/ZuixOWhWp/Wwyx37HX0rI76dJePu1+Qmq1xFemOTONK7TeB9X4DXChr++fWeQR302BKXJvc8uzORdFpyCNJf7CQyfn9noHeSUtmb4X8txUMNH8L6gyeBGCLT366jO8K4hQRY/0sZyJiDCQoIZRX4qDBz82DIVmtw4uu6fiqsP1yb78lS9juP7L2MnQxHD2Uo4TxEI5rGx7xQp5jJ+MQ2HAaTcNyzyfWn5VvZJAc/SKg8821wCroFjfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXpaA18Q62l9MLdueUryI2mFXL4XapDs/Iumh++Lekc=;
 b=X2wtiilRFFjHoSIw+Mz6+Iz+61uKjEVRkY8wVmj+Cu4lpQy+OLs2mdObsjKyCSreFV1qkgekHPp8iJp+N9C0puANnzBGodNsSUv7fUTfxRO+qPNFS6/oge9mBJyiiChyKgSWZubFBnzVw4C/vsHvuuY0hz+S03srJvq34dIOto8=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3652.namprd15.prod.outlook.com (52.133.253.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Wed, 20 Nov 2019 06:54:00 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b%4]) with mapi id 15.20.2474.015; Wed, 20 Nov 2019
 06:54:00 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: rgrs <rgrs@protonmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: MCTP over PCI on AST2500
Thread-Topic: MCTP over PCI on AST2500
Thread-Index: AQHVn2VJNP7At+t4ekie9daSxgPplKeTGawA
Date: Wed, 20 Nov 2019 06:54:00 +0000
Message-ID: <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
In-Reply-To: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b9f75c0-cdaa-455e-6c0c-08d76d866c5c
x-ms-traffictypediagnostic: BY5PR15MB3652:
x-microsoft-antispam-prvs: <BY5PR15MB36528E4D1CD601A9210AAFB8DD4F0@BY5PR15MB3652.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(39860400002)(136003)(346002)(376002)(199004)(189003)(71190400001)(316002)(71200400001)(6486002)(76176011)(110136005)(8936002)(6436002)(25786009)(6512007)(54896002)(6306002)(46003)(2616005)(66946007)(66446008)(64756008)(66556008)(66476007)(7736002)(14454004)(53546011)(76116006)(6506007)(102836004)(6246003)(476003)(4744005)(99286004)(186003)(86362001)(33656002)(2501003)(2906002)(478600001)(446003)(5660300002)(11346002)(81156014)(81166006)(6116002)(8676002)(256004)(36756003)(486006)(229853002)(24704002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3652;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lkQslO9Aq4oD39qe3LzVBYw/cH5HUSlQgTiR23Nd0zGbEUjl3b+tZXe6nifuWQMnKHBJS3RazFuZ2U/fMUXkzz483TCCoIrhhkxXhVN6pYevqyF9y2tPHdPceVObaRKgIZVrgTNN4+AESkqygHnWSi4U4GzQjqoFkQRFePYACPJ9+h1nznroMR1yJxBMBbUPMK7QkN27KFVvf85HnkYbLCMqVOyNtmegXSHIxR20wLelDvCjOi2o354UpIJ89AxxgmpcAn8X+1YtZGyVa+pErSJP3EUr/+xBmDZxErWklP25dgjRhDT6iA8NP8J5vT5mWf65/EbaA3ALsTjIuYoJAOuXuQxwtZMtva0oDoxMaVZHL+icWxKlRqMHgcC+kv/DRi5kmV6/519XibV+8QEg0SbCHBp/vr2xrnLbVtDDPz0cYdXzCx7pE6v8meoxBnch
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_037D4669D49C4DF8B49B4F3BD97451AEfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9f75c0-cdaa-455e-6c0c-08d76d866c5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 06:54:00.5956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IxmWoyjWSS3D4h+2ixlkPD73rxXTMjHSgtkFp1AHK3XDU4D/O1ICXEv24Ftqb27pDQynSJEl8/+R/Q5TeW3emg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3652
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_01:2019-11-15,2019-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1011 mlxscore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 mlxlogscore=822
 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911200061
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

--_000_037D4669D49C4DF8B49B4F3BD97451AEfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBkb27igJl0IHNlZSBhbnkgbGludXgga2VybmVsIGRyaXZlciBzdXBwb3J0aW5nIG1jdHAgaW4g
dXBzdHJlYW0uIEkgd291bGQgbG92ZSB0byBzZWUgdGhlc2UgYW5kIHdvdWxkIGxpa2UgdG8gY29u
dHJpYnV0ZSBhcyB3ZWxsLg0KDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlr
aGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmc+IG9uIGJlaGFsZiBvZiByZ3JzIDxyZ3JzQHBy
b3Rvbm1haWwuY29tPg0KUmVwbHktVG86IHJncnMgPHJncnNAcHJvdG9ubWFpbC5jb20+DQpEYXRl
OiBUdWVzZGF5LCBOb3ZlbWJlciAxOSwgMjAxOSBhdCA5OjQyIFBNDQpUbzogIm9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZyIgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IE1DVFAg
b3ZlciBQQ0kgb24gQVNUMjUwMA0KDQpIaSwNCg0KRG9lcyBPcGVuQk1DIHN1cHBvcnQgTUNUUCBv
dmVyIFBDST8NCkFzIGluLCBkcml2ZXJzIHRoYXQgdXNlIFBDSWUgVkRNIGRhdGEgdHJhbnNmZXJz
IHVzaW5nIE1DVFAgY29udHJvbGxlciBpbiBBU1QyNTAwLg0KDQpUaGFua3MsDQpyZw0KDQo=

--_000_037D4669D49C4DF8B49B4F3BD97451AEfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <87317B25B3FBE04A9C2DA8CE9F05416D@namprd15.prod.outlook.com>
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
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpw
Lm1zb25vcm1hbDAsIGxpLm1zb25vcm1hbDAsIGRpdi5tc29ub3JtYWwwDQoJe21zby1zdHlsZS1u
YW1lOm1zb25vcm1hbDsNCgltc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzsNCgltYXJnaW4tcmlnaHQ6
MGluOw0KCW1zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0OjBpbjsNCglm
b250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNw
YW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQt
ZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0No
cERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBw
dDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEu
MGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2Vj
dGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIj
MDU2M0MxIiB2bGluaz0iIzk1NEY3MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+SSBkb27igJl0IHNlZSBhbnkgbGludXgga2VybmVsIGRyaXZlciBz
dXBwb3J0aW5nIG1jdHAgaW4gdXBzdHJlYW0uIEkgd291bGQgbG92ZSB0byBzZWUgdGhlc2UgYW5k
IHdvdWxkIGxpa2UgdG8gY29udHJpYnV0ZSBhcyB3ZWxsLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6
bm9uZTtib3JkZXItdG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGlu
IDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEy
LjBwdDtjb2xvcjpibGFjayI+RnJvbTogPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjEyLjBwdDtjb2xvcjpibGFjayI+b3BlbmJtYyAmbHQ7b3BlbmJtYy1ib3VuY2VzJiM0Mzt2aWph
eWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyZndDsgb24gYmVoYWxmIG9mIHJncnMgJmx0
O3JncnNAcHJvdG9ubWFpbC5jb20mZ3Q7PGJyPg0KPGI+UmVwbHktVG86IDwvYj5yZ3JzICZsdDty
Z3JzQHByb3Rvbm1haWwuY29tJmd0Ozxicj4NCjxiPkRhdGU6IDwvYj5UdWVzZGF5LCBOb3ZlbWJl
ciAxOSwgMjAxOSBhdCA5OjQyIFBNPGJyPg0KPGI+VG86IDwvYj4mcXVvdDtvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmcmcXVvdDsgJmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs8YnI+DQo8
Yj5TdWJqZWN0OiA8L2I+TUNUUCBvdmVyIFBDSSBvbiBBU1QyNTAwPG86cD48L286cD48L3NwYW4+
PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286
cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IaSw8bzpwPjwvbzpw
PjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9v
OnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+RG9lcyBPcGVuQk1D
IHN1cHBvcnQgTUNUUCBvdmVyIFBDST88bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPkFzIGluLCBkcml2ZXJzIHRoYXQgdXNlIFBDSWUgVkRNIGRhdGEg
dHJhbnNmZXJzIHVzaW5nIE1DVFAgY29udHJvbGxlciBpbiBBU1QyNTAwLg0KPG86cD48L286cD48
L3A+DQo8L2Rpdj4NCjxkaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJz
cDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGFua3Ms
PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5yZzxv
OnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+
DQo=

--_000_037D4669D49C4DF8B49B4F3BD97451AEfbcom_--
