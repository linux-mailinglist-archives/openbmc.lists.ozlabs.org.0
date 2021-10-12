Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F54429BB7
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 05:03:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT0qL4YMLz2yPN
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 14:03:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=InventecCorp.onmicrosoft.com header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-InventecCorp-onmicrosoft-com header.b=pVR4gIo1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.130.110;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=mohammed.habeeb@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=pVR4gIo1; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300110.outbound.protection.outlook.com [40.107.130.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT0pr4XKWz2xrH
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 14:03:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMuPBsMrTta4JDGyJCfyBnJUHb+g42ZzKXoayoO6tMpYxxiKPsB/5a2OzDPIgU2xp7M003Vn24g8E43I2Ue3qJL+veEYQ711dRVBw7gD9U/hRm4aKAi6pJjfDlKzMOYo7cMAzLMEJPeopQJzAE5fiS2cuwQpGUaDdSMW0URsV91onWdZCqt5ic5HnEfJVqgQerUD9iuqIcmCyb/zq1YGP7PYicH27Rph5ES5oiNrk1Yw10ApWWAMbccVap90pRJqosy4Ewm/EOclWavOr6uzJB1dTQSMKVSelS3B1HIeTRZVnTrs2FWQTY5YNZJsWgUwxDZ/sPGKXYu9+t4UpZRayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQN3Xcumc//eFoMCTlfurLIZNI7Mz3EMwTwsEHhEM3E=;
 b=EtdiRP7C76Vf9uaKqXgRRAxeZP7Jkx0kegutCyjAz02CrZ77iYAdKk4n6dScQmSzWmRDXF8HlZrgLtL50RD1mqT0+5ScBbtRzXgnZJVD4YRg62gLa71lPqE8mA+e6D2vS573GYG11Q/S7sSvF33nBAruoxAjzgPrDY092lpherN+qTJeOPSZUdGYKOxbJ6ZL6NqOq2XKudIKsCyB/u6vPt5sEJiXEG/dYETsc/C907vbAbBtuERkMCj+xYWkqzfVqOLwt7hTgSP/QtHh/GzZxAD2L7gGMQ7zMaklXFWhnGX1+4Fi3lFEdDYeY2oSmzMM5dLCQ5klL9ltU1vwbh6Eug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQN3Xcumc//eFoMCTlfurLIZNI7Mz3EMwTwsEHhEM3E=;
 b=pVR4gIo1ZtrgCD5wriguUScwjRoVoj7PGc6aPr0BFM45qMRIVq3UsLFzsCxJqMdp4BQBX+FTxmldjmyQXn3/KOVYI+J6EsLnFwc9GSs+U+Vo0/VWxNbSOm5AHza6Ya0V2YdKuVV7yBlukHpiTMvRlt8z2ZSz96VyD+3c6lpS7hU=
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com (2603:1096:300:48::10)
 by PSAPR02MB4629.apcprd02.prod.outlook.com (2603:1096:301:20::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 03:02:53 +0000
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::30ce:9463:f05:ee62]) by PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::30ce:9463:f05:ee62%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 03:02:53 +0000
From: Mohammed.Habeeb ISV <mohammed.habeeb@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Etag support in openbmc
Thread-Topic: Etag support in openbmc
Thread-Index: Ade/FQhRoKYEaaEvQYOiRT9avfKCpw==
Date: Tue, 12 Oct 2021 03:02:52 +0000
Message-ID: <PS2PR02MB35412394ABF3E0441D72627E90B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=inventec.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2863f6a7-2f30-4a39-aa55-08d98d2cc87d
x-ms-traffictypediagnostic: PSAPR02MB4629:
x-microsoft-antispam-prvs: <PSAPR02MB46294C770F1E6DF9B03E4DC190B69@PSAPR02MB4629.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 07TafdsPAt2gpkqz3xx4Y/5w4prC2pqStdkLqjUPGQrPxudyxZw+TwkmgA0JR9xAL4qNWvRr/5qQevevuhKSHs016tmYLaw9mnzL8BSqylhNOeon8KGIvRSBCIjG1Opv6Q+g5WwIJ80n/shA8CN8Hxqa/N6TF9vehIldE/fCwwScpLT7sixSEqYf5RieX3SM1u7j2SCU2rT6a7/L2YqTxBOkHlU9ebv+cM1S2ytSuOMq6603gM2TQ2op3WNRo203cE8gQNK63Z0ACbdnU179E9iOMqUi1eVLL1S7xG3l3c5hAqvbzD41lY2GZ4kobAKKQw+MVn5w4GV3dtyIGxfJUmNdD9nmEtpwrKIW0HlNbgAMOUSfPSB9SCX0lRkDt6uWmujNqD+nXRrx8wTuB8JigYb03nepBAROa6W4ubBYKVJwsidAIhuI3YbM2zU8it4Mrox4oBS6R6qiaDL3lfXCiMtQinVlfq0swkWDRz14tT2F5m0zI6E+SUVUcBNdB2ttx0UatEhwdeCriE751PS7QxGN4RvuU95iryAA027fViDOvEfybOZluXgsTmwxstMVW2I1zHozQxHWurXgahgJQ+0i5nOEOKQ1AOHTE+wJqBpLLgbpxD4eRG7QjT7nfIp0JRwY7jDeo/xsBqvmB0znlUjTIcPM6wZV1jVbisZ/Y6vrAjXfe6TAqzSrHGsmwAWfqlVKp6D90737WWX0M1NT9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR02MB3541.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(86362001)(9686003)(55016002)(508600001)(33656002)(6916009)(66446008)(64756008)(66556008)(66476007)(8676002)(8936002)(52536014)(5660300002)(6506007)(7696005)(2906002)(186003)(71200400001)(66946007)(76116006)(558084003)(3480700007)(38100700002)(316002)(122000001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xSBVUvzlS2164oyS6IjiCcovejF4B+6nf6ox7dCjw2ZS5QemFH2wo9SG8a?=
 =?iso-8859-1?Q?k/uKseY1c0f/TWkguzDykJ0l5m8rStv77KGtPCx8bc5YuU6V5LvXyLAj5a?=
 =?iso-8859-1?Q?/tRYM6PrIttrKARYCTFLiLTfXtjPiZ+ALCD1LJoX7FYmqbJ1GbWGq4MqVv?=
 =?iso-8859-1?Q?dERfjLrsKJSs9Ij/uCE72RGkt/w0He3CbVJ6l89LlVzJpDP1EYCpuJRsZ6?=
 =?iso-8859-1?Q?u33LYSeFVS+QpRkZPxL030m6ybjUn7RQJUJu39JJd0qf7fOaPznGp9aQdi?=
 =?iso-8859-1?Q?RhDc66iP+i9UpxLhQBJ5aUc7dJDYyNSD4WdD/9w0tMKrTQholNkWBxHVsY?=
 =?iso-8859-1?Q?rKuAw1s2EM4cfqw6WNQEx7lZYkxHdJc0CvfbjFsNBSfIAAaE6UQkhJg6RT?=
 =?iso-8859-1?Q?IOWXMOP6JcuNbVQMT74edY1n6iky3iR4eeJ7z+39bNfIMZbAAgq3uDpAAz?=
 =?iso-8859-1?Q?PgXFNXsJIYE+Ut64MMjMTwQ0Ll/ZjiWVNQIwqj/9H0qR4J82MPT+lzKF23?=
 =?iso-8859-1?Q?qB4eQ7DT3f6lYEdHT6/W49MtIFNAmBZFoFN9cXa0JJj+qJx30maFuyq+Wl?=
 =?iso-8859-1?Q?fUEEO8btCIqG+8/RcUNYkJ4/NKxbZqdPKNo/PjKLKETnJqUf6NKp2Y3vnS?=
 =?iso-8859-1?Q?tMk3bPb7sOtkEPZJVZISw8ZJ+hbyGpcAVvB8dD3UgRTPbdMtKeKpFl005q?=
 =?iso-8859-1?Q?x/inoNQa93YkEfRrx5Kwrf/dLCU6lWpIIioBfBmeNtYImMMt9RsNamJLHr?=
 =?iso-8859-1?Q?h1icKcVAvblu3L6f8arfjzTY8YLXxLzJIXMsjWYG2HByrInM2mYKsmJjiA?=
 =?iso-8859-1?Q?k1yPeIRgOT55rTnowE2iwbhOeHcAoC/a726F85cC0/KhsH/iKUuEGjp5BH?=
 =?iso-8859-1?Q?HfH2VJzYl7/nYDBla9gEddZPvz1DkeoNB9382yZxJQGC1y3iiv19PnoXfH?=
 =?iso-8859-1?Q?sAEk+SuC4kgEqS8ir7sPj4Wu4PVeuWR7JLRzF4CjVrRjzpfzsYWtEhHPYL?=
 =?iso-8859-1?Q?3zWkvIiVTG2ZJ5gFzdJqmucZ7GZqRsa8AfvRbUFQ+vrNfLcVU4c/L1XWRO?=
 =?iso-8859-1?Q?XSvEmmSi9YQUb5o/TIKPiGhFpfEXM4x06hQ8yz2uB/g5VN1t8mGuuRiec3?=
 =?iso-8859-1?Q?N1jDo4qRJP2JHRXoRt/RCLwqXbUoAmPYyqELAt9kE9SrPj6J32YYMynhQy?=
 =?iso-8859-1?Q?DGsRgJHf8sCtB0mJoPx5iv2uJwdlHaFMlBmPmU/GnIROz33dZhiXCCU+nl?=
 =?iso-8859-1?Q?A2zBu8g/N5015GkrVID5eQsI6fgKBMjb6H9jGzmvNs8f1q9Z9cQOXajZKC?=
 =?iso-8859-1?Q?SUJztSu+Qh1Ex0fi5nnxwDVzsl6hqxnF7Sxhu2TigL/RCIR1T6WNsTTwYh?=
 =?iso-8859-1?Q?izcxy32LXSdRbnvjLaQoztnN4Q1fu9Gk3U2+dvUyUhCp/wFOfJ7qU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR02MB3541.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2863f6a7-2f30-4a39-aa55-08d98d2cc87d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 03:02:52.8563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sNb4cOjz1Rhj9wX+6xgfNlDhbWNohrWT1SKDe+R88qxDDIpLSBkZx2Vq6v9jY+PDTqwhbeojt7L2lBiFX46WMFCDCH1IMNpXBFQcAzLiSnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR02MB4629
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

Hi=20

Do we have the Etag support in OpenBMC? I see there is a mention of ETag in=
=20
bmcweb file redfish-core/src=A0/=A0error_messages.cpp, however not sure if =
Etag is supported.
Please let me know.

Regards
