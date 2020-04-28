Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE4A1BCE66
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 23:15:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BZDP5RYSzDqGt
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 07:15:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2387508ca5=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=kIfmQ7zv; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=jfe7uzXg; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BYvx0vKMzDqQW
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 07:00:58 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SL0rT2003051; Tue, 28 Apr 2020 14:00:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=jwVXCh5VKUPXsO0rlWw1CNoEYOplPBTX/nBLnIP25hw=;
 b=kIfmQ7zv7BcwXXKblYIPJRnZ+Ke+J3OjlwnIvUyavS9UPt4e2nZj9nCuJojfn+wACelN
 UqN89n/HMHtW+J/81jwbuy9EhF0+NOuKGmdBLrFnPUawMOWn48Qh6W0svbqf1rtZn1/w
 7SpZuS4oROa49sajyXqM8O6jIqZ/40T3lpI= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30n57q9qe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 28 Apr 2020 14:00:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 28 Apr 2020 14:00:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Or04IMl8Axl+2J3bu6GQdCSw9wiR9EA/WE4dRHfmoL/ddELF5y7mWgrR1p04MOMZIIlzcZAOuA5T55OsgGaCvGKAirF54Fa9VOyfYftIYwc9HdKCSss0axSul/otbcXaAQQ7GVYdF2+jEnF411NrM6JbUcBGjok1QbsWT/iAggIdmpJOppJCczz77J3uKvjN1F1RlL9F+Hgxq67Xpz0nECdT/dXmkSBazzjeqxLIMp6c47IgrXu4AGba7wlPFkb+afqZndytd+1iP++McodbogLfMW8ENDL8Exn75JtSETN8hbx7nwkpKp1jQDzL3liM7xtH69BMJRTdr5JACmWzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwVXCh5VKUPXsO0rlWw1CNoEYOplPBTX/nBLnIP25hw=;
 b=BFLIwRu3Lwwoe/5TUTEJJhQbNKGmB1GVFIIWnBgAWx13a/AsLoTmA00+xH5lyglH5Skf2tlfKmThdmzqsH5WqzjsNbrvfnFXkLWzqtmx7taqG4L4NEJ3UOLe8SQNWcfGxy4YW+5XZIYlNDP8rKxmTAl4jegrj8AoFlrPIQkYlT/OSZiV5z7XA1QA+5aKXCPZAuZKDkzggJFQNUReIG52xwBztfnL2xenLhzqK3TzVAm6XU3G8H+hPUlVQEmPJRzNDOYxondADbOLYy51pc9+mp7giX07rUDZU0hpPJtGunq9wkfxrhj715MiEqLLcYkng5I4HtiL8y7UTIWqcoL6+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwVXCh5VKUPXsO0rlWw1CNoEYOplPBTX/nBLnIP25hw=;
 b=jfe7uzXgGeZhAPEFbsdE8C5njzx9mx9UgRkHB+YDzp/h/afXE2Y5hHxWvRbYwdcmbhm+5xpjtfB3kMKF2QluP0IN8XefBZzHrKe1hSo2PBwW1H479Jg1H3Mcaya5VVAd2g/jDstHlj5O7PNaLK8HIf8LYF3VQpp2OZjsPjJ1WK0=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2293.namprd15.prod.outlook.com (2603:10b6:a02:84::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Tue, 28 Apr
 2020 21:00:16 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 21:00:16 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>
Subject: Re: [Potential Spoof] Review restart cause
Thread-Topic: [Potential Spoof] Review restart cause
Thread-Index: AQHWHaAEoJDnxCw45kylgoxFKoVpJA==
Date: Tue, 28 Apr 2020 21:00:16 +0000
Message-ID: <6F213908-2A67-455E-B9F1-95B555FE881D@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:125d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78e9847b-58c1-4561-8a4e-08d7ebb72732
x-ms-traffictypediagnostic: BYAPR15MB2293:
x-microsoft-antispam-prvs: <BYAPR15MB229369E7E420C6B83ADBABBADDAC0@BYAPR15MB2293.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(366004)(39860400002)(346002)(396003)(376002)(2616005)(53546011)(33656002)(66946007)(66446008)(966005)(6512007)(66476007)(64756008)(2906002)(5660300002)(6506007)(86362001)(4326008)(76116006)(478600001)(36756003)(8936002)(66556008)(4744005)(71200400001)(8676002)(186003)(316002)(6486002)(91956017)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IdhEOYEF4XqF1ohvV+EfPXDycs+BVJ7wGuTwlBG17s6OmMHFsy9MzFj3uZHgopeHkOs5vb4oSsIkNksV6t4mwoqprXZhRXkCkCiuPEuT03/EXCQJdJVxqnWETSXqlNB5aw0i0seM4aiV3rfiyxV4449mcYhNSXmGlBjU/S8D3gZGLZA97AFPLjwV0Tbrl0hgppUfZar+WjLrI4Ja+YcDmya0lLf9/LmfIXsosY4+EB+p8tDRcvNcSYY5ug1YjMsU6Riua3mMuuSK5gRxTCgho+Juai+43e+v0QoGCAwD6J3bkQmJbqx5lQOjIVg6rcVflfPgc7HkqeY5ucuGNdSXI6I6ysDctD2eMiGVeS4o1QT10KswJal0bY3OXAa+sBKAd5rrx5XL2GWtTVUvTKBoZfa4Q2D2jkyvhu91Acc3ScQsrbz1lzR++0MnGwjpnvcHBQTntZqqohtfGwGbT/2Z2vy9+V3rM0af81srE2sXDvAXmXA7v6abcryfM/8DEL0lDosVB0IddbmvNm8Igzfa5w==
x-ms-exchange-antispam-messagedata: /fIN1ELI4xjrZAArDYLq2EzRnTkZ0GbOCyRDr6MUQ0d/kbw6s4ZKbkoQXn5kay90uPEhT41iHi+X6mGpfDIZyd2I3RNwW8z9hzZ0u5jlUgHph9XAjKtLrFwHn7H2zjtQCQLLu0z71c1FP+kyPMs6iQoWd1ASZUU/Z0WDia7y8w45L59Iq2/QOXnFlYuFA5X+p7ykoDpR5wEsysJzQpw2jq+NAGc4UptZHM+GD95jE1p+RexV+97bB+BNp3uNd8rVzkg/BALjzavOSMNjogIzmHaWqPXQqK+5LBFlclmOLQ5Aa+T34YcbclYP22M8KecyO6y2Sm1IYVb66ywUgwiDCW3GNFHHS9Eyk01DL2YNCTfCmwlnUsJrjvNdyc0lIR8skayqRERa0u6rej89HuuwxcRiwg1Ff4NJV+oOhSU/4LS+Nl79Pu5sXnxT7gjbLY68d3Io1T9FMAqpM7gFdg2+o9CiFbK3w5hoYHCfYt3/a5WaSddMp4bYpNCGArRtTp9GUQHso/NUiJLG/8qu055aW+AZA7upQcPyJsU76mzzLxRBTN8q+os02QzVCJYuaDvbvsX6nQtzPneeP4UzVebjBBQwhyoxqrtXPEdkGsSzo4wFFA6bjmX5v5Uk9hznNItdpxjI/RwpImETfV3Qxzim2m1qlnSMNIJ+68gv6CyPqrPp606435nN3c/rVlU47ccEXEXtsiCSBxNE9+6REjzabbnMGqS5MY4IwTL3B6/RWxzhqjMMP8LSNjpdTG+i0r3K00WMZMcSZytAK7M20NlvmULiJUapJC1uF4ZnlgQqUxJ1gQ7H1v7OR9YUkbpTkQ7ieiDTJ4xgNVDM/KU4DK1Y5g==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_6F2139082A67455EB9F195B555FE881Dfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e9847b-58c1-4561-8a4e-08d7ebb72732
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 21:00:16.4071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WdAlz9QahfGySt78UtGWd8TdcvMXdM0D+y86Mrm8JSH1nTxKDRGobKKChvfcb0y9/DBeDIWDM8LC7vusua9vhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2293
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_14:2020-04-28,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=703
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004280165
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

--_000_6F2139082A67455EB9F195B555FE881Dfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGhvc3Bob3NyLWhvc3QtaXBtaWQgTWFpbnRhaW5lcnMsIFBsZWFzZSByZXZpZXcgYmVsb3cgcGF0
Y2guDQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21A
bGlzdHMub3psYWJzLm9yZz4gb24gYmVoYWxmIG9mIFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FA
ZmIuY29tPg0KRGF0ZTogVHVlc2RheSwgTWFyY2ggMzEsIDIwMjAgYXQgNDowMiBQTQ0KVG86ICJ2
ZXJub24ubWF1ZXJ5QGxpbnV4LmludGVsLmNvbSIgPHZlcm5vbi5tYXVlcnlAbGludXguaW50ZWwu
Y29tPg0KQ2M6ICJvcGVuYm1jQGxpc3RzLm96bGFicy5vcmciIDxvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc+DQpTdWJqZWN0OiBbUG90ZW50aWFsIFNwb29mXSBSZXZpZXcgcmVzdGFydCBjYXVzZQ0K
DQpIaSBWZXJub24sDQpDYW4geW91IHBsZWFzZSBjb21wbGV0ZSBmb2xsb3dpbmcgcmV2aWV3LCBJ
IGhhdmUgaW5jb3Jwb3JhdGVkIGV2ZXJ5dGhpbmcgZnJvbSByZXZpZXcgZmVlZGJhY2suDQpodHRw
czovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6LyMvYy9vcGVuYm1jL3Bob3NwaG9yLWhvc3Qt
aXBtaWQvKy8yOTk2Mi88aHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91
PWh0dHBzLTNBX19nZXJyaXQub3BlbmJtYy0yRHByb2plY3QueHl6Xy0yM19jX29wZW5ibWNfcGhv
c3Bob3ItMkRob3N0LTJEaXBtaWRfLTJCXzI5OTYyXyZkPUR3TUdhUSZjPTVWRDBSVHRObFRoM3lj
ZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2WGtrY3JJYXFVN1VTbDVnJm09
Tm1aUmYySGl4amR6MUdwYlREWjMyc3ZpVWNjNUgyWHFaQ3gzOTRDVUtQMCZzPXNVWUhaWWUxUHFS
UzJ6T0pPTmItcWRWZ1dWd25CWFViUzA5eGlkQ2RkZVkmZT0+DQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_6F2139082A67455EB9F195B555FE881Dfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <B363C061ADA4794E934082F29E0C1A22@namprd15.prod.outlook.com>
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
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQpzcGFuLkVtYWlsU3R5bGUxOQ0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglm
b250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5N
c29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZTox
MC4wcHQ7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdp
bjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29y
ZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGlu
az0iIzA1NjNDMSIgdmxpbms9InB1cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlBob3Nw
aG9zci1ob3N0LWlwbWlkIE1haW50YWluZXJzLCBQbGVhc2UgcmV2aWV3IGJlbG93IHBhdGNoLjxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8ZGl2IHN0eWxl
PSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBw
dCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iY29s
b3I6YmxhY2siPkZyb206IDwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj5vcGVu
Ym1jICZsdDtvcGVuYm1jLWJvdW5jZXMmIzQzO3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxh
YnMub3JnJmd0OyBvbiBiZWhhbGYgb2YgVmlqYXkgS2hlbWthICZsdDt2aWpheWtoZW1rYUBmYi5j
b20mZ3Q7PGJyPg0KPGI+RGF0ZTogPC9iPlR1ZXNkYXksIE1hcmNoIDMxLCAyMDIwIGF0IDQ6MDIg
UE08YnI+DQo8Yj5UbzogPC9iPiZxdW90O3Zlcm5vbi5tYXVlcnlAbGludXguaW50ZWwuY29tJnF1
b3Q7ICZsdDt2ZXJub24ubWF1ZXJ5QGxpbnV4LmludGVsLmNvbSZndDs8YnI+DQo8Yj5DYzogPC9i
PiZxdW90O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZxdW90OyAmbHQ7b3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj5bUG90ZW50aWFsIFNwb29mXSBSZXZp
ZXcgcmVzdGFydCBjYXVzZTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZu
YnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5IaSBWZXJub24sPC9zcGFuPjxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkNh
biB5b3UgcGxlYXNlIGNvbXBsZXRlIGZvbGxvd2luZyByZXZpZXcsIEkgaGF2ZSBpbmNvcnBvcmF0
ZWQgZXZlcnl0aGluZyBmcm9tIHJldmlldyBmZWVkYmFjay48L3NwYW4+PG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48YSBocmVmPSJodHRwczovL3VybGRlZmVuc2UucHJvb2Zw
b2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2dlcnJpdC5vcGVuYm1jLTJEcHJvamVjdC54eXpf
LTIzX2Nfb3BlbmJtY19waG9zcGhvci0yRGhvc3QtMkRpcG1pZF8tMkJfMjk5NjJfJmFtcDtkPUR3
TUdhUSZhbXA7Yz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JmFtcDtyPXY5TVUwS2k5cFduVFhDV3dq
SFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmYW1wO209Tm1aUmYySGl4amR6MUdwYlREWjMyc3Zp
VWNjNUgyWHFaQ3gzOTRDVUtQMCZhbXA7cz1zVVlIWlllMVBxUlMyek9KT05iLXFkVmdXVnduQlhV
YlMwOXhpZENkZGVZJmFtcDtlPSI+aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8j
L2Mvb3BlbmJtYy9waG9zcGhvci1ob3N0LWlwbWlkLyYjNDM7LzI5OTYyLzwvYT48bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+UmVnYXJkczwvc3Bhbj48bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4tVmlq
YXk8L3NwYW4+PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_6F2139082A67455EB9F195B555FE881Dfbcom_--
