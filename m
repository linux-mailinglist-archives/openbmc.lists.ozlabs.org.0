Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4ABB58EB
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 02:18:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Y0vg0Z3PzF0kv
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 10:18:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=41641c7681=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Ebu2rYdg"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="TxnaKIpg"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Y0ty3DtczDr6D
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 10:18:16 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8I0GB5N020693
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 17:18:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=2wvx+VLmG2BnyBkaO+mRCPX3aVovTYnH2oR1dl743bQ=;
 b=Ebu2rYdgtn3+xGwc0TNeMhwV0BJceLiE39/kY0OGNBmvWw/Uu63xK43eULBAlKvXbTcf
 kAaMaw//2VuD+6s4AtmhsvYhKNs7Xyvs155tBUvXfUtSCr+44m9b0koIhDRNeTexT94T
 iO8y20FFaUyD7gOMniCfSHZ+YxC76nyZFAA= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2v37kr0hmd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 17:18:13 -0700
Received: from prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 17 Sep 2019 17:18:11 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 17 Sep 2019 17:18:11 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 17 Sep 2019 17:18:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPRtaMTfHYHQwueKilLAjVcIg/zaVU+txS5HbjN9qvZgOYVCwfunhA6C/E5crq0vgv62nVlRwAYuVxPcjWdXFQ0pw9pdnUKKnNADAcI5lUykL4uQ0M2QxmVUFE0CjGFZVAJACDgNnuDFJ3z/iFDBdKg1mdgGeu/Z+eJJ3+N8YG6Om4noiVNG8FixV3mF8/14XQcT30w0gsG7lx5YwnYDUBUddY9AWBvBu0OAnLVdKdg9KZidXl+NjxDbdpks1VmLC8DByVgIUhc2maDv9DV6mFyMj93HSLC67q/D08Tecgu/UEmpDlkET4GqK55YLvZj5/gqV7Xd08zT/gfRaGygxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wvx+VLmG2BnyBkaO+mRCPX3aVovTYnH2oR1dl743bQ=;
 b=YLUXq0dNMsbX4thon+qLjAD81KIpLdIuTusTdcTtdxkgN03at9qkFwLlIQW38uny61aS7G6fRaVW6PQ4DTaSH2FBQEtgTyN1MGsdYrJxK6SjugK2QPVYR+pFBQvEebAXZCxXgidcvz6H5P5zlzQ0QTDhnRsxpGKLp2swNCmOBDdIEzuews6x9+erpx0jXUvypRy+uxgquux239IsWPDDgImoI99gPD4fQoEcQhCZ7AUpyoFE7GuzcnLRpglAa/XSIIhpc8mG2bZPil6r+S1wZSWhvPB1Rr9iaJ23W0jsBAv2tucgcvTtHF7h60wR0S7dILjlzNeErf6YNukapCT+WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wvx+VLmG2BnyBkaO+mRCPX3aVovTYnH2oR1dl743bQ=;
 b=TxnaKIpgAu75kQS8i/fghh4xcI80gtcE2fM1rL4tPaYehL7nm8KwciYRMNTmiHADY4hn6TPNvOg16IQbYzwJz5fiPBxarbo2Mc0eBPU2CfulAEZNDKj+Gmu8yEp8QcvQoUhAGYXoUIlFbOZg6MXGjzOratIK7QNXJrYo0hG/Z6c=
Received: from DM5PR15MB1211.namprd15.prod.outlook.com (10.173.210.138) by
 DM5PR15MB1402.namprd15.prod.outlook.com (10.173.223.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.26; Wed, 18 Sep 2019 00:18:10 +0000
Received: from DM5PR15MB1211.namprd15.prod.outlook.com
 ([fe80::9c67:420:3467:3931]) by DM5PR15MB1211.namprd15.prod.outlook.com
 ([fe80::9c67:420:3467:3931%12]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 00:18:10 +0000
From: Tao Ren <taoren@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: emmc secure erase
Thread-Topic: emmc secure erase
Thread-Index: AQHVbbaNvSmB/PEMvEyBRLCXalDlbQ==
Date: Wed, 18 Sep 2019 00:18:10 +0000
Message-ID: <b24011a7-a69d-702a-0e55-61035287b8ae@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MW2PR16CA0071.namprd16.prod.outlook.com
 (2603:10b6:907:1::48) To DM5PR15MB1211.namprd15.prod.outlook.com
 (2603:10b6:3:b5::10)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:da8b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b85e348-ddc0-48fd-e5b6-08d73bcdaff4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR15MB1402; 
x-ms-traffictypediagnostic: DM5PR15MB1402:
x-microsoft-antispam-prvs: <DM5PR15MB140280B6E8C41B268BF416CCB28E0@DM5PR15MB1402.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(366004)(346002)(136003)(39860400002)(199004)(189003)(36756003)(6506007)(316002)(66446008)(386003)(6512007)(25786009)(102836004)(14454004)(65956001)(86362001)(6116002)(52116002)(31696002)(81156014)(81166006)(46003)(256004)(8676002)(476003)(8936002)(186003)(5660300002)(3480700005)(2616005)(99286004)(478600001)(65806001)(486006)(66556008)(31686004)(6436002)(305945005)(7736002)(66476007)(7116003)(58126008)(71200400001)(66946007)(71190400001)(6486002)(2906002)(6916009)(558084003)(64756008)(133083001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR15MB1402;
 H:DM5PR15MB1211.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2sypb+KIX8r3tkkZR50CMK/ix/BblBscnnoPQq4uEu+fwAGSZRhhQnkXGPJy3ksDYtgzbDWLRUoEqXKmSG4iDr21LxidD7Hvb33iDhZNXgcGZdIKiyAWbCIpmw5xUbC/7ncCOvZ3Wsi3SYGKFMXboit5FHY9QipS9oS7o6xTxxxJBAzfYTqxNrAiTSy+lT6nvLehO/iVClSsF2Cx44EihMM1+FXA/Pwhxb7OMV1IjlwqJbrEYiG7PyyxrrUNSGIpELLDlO36AQgdpMI6ZFSiqMFIhYRUetFi1cB+bbrVnzJ9m4cHJ2CyMiIMhnLtqpTQFnhEOxYl3clApn7YwG2aBulX1TvxWEjjfhkiTCsdhqJID8FEmEGVdn+1lnB4yznASkiqM6m23jwzjYoYlpu+45Q9ylqqnHlQOlXHFhmGWCU=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D80839CAC4C874428B8BAAFDF4B2A682@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b85e348-ddc0-48fd-e5b6-08d73bcdaff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 00:18:10.4270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1kNNPk/otuB/XzRA6vyEEp2iOApHbHj4WnGYLb9DBLnQRVUCUZFC1TWWCZAeKLIY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR15MB1402
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-17_13:2019-09-17,2019-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=639 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909180000
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

SGksDQoNCkRvIHdlIGhhdmUgc29tZSBjb21tYW5kcy90b29scyB0byBzZW5kIHNlY3VyZSBlcmFz
ZSBjb21tYW5kcyB0byBlbW1jIHdoaWNoIHBoeXNpY2FsbHkgd2lwZXMgYWxsIHRoZSBkYXRhIG9u
IHRoZSBjYXJkPyBJIGNoZWNrZWQgbW1jLXV0aWwgYnV0IGNvdWxkbid0IGZpbmQgc2VjdXJlLWVy
YXNlIHJlbGF0ZWQgY29tbWFuZHMuLg0KDQoNCkNoZWVycywNCg0KVGFvDQo=
