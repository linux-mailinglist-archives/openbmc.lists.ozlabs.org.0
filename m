Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB29A5ECD
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 10:38:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XX7xL1gb8z3fVj
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 19:38:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729499884;
	cv=pass; b=S92Tx8dY+NW3gOLhI4Trhz/+YTfwoVDbZ32qedXWe/6T/kbfRo9EN6uf7ms8yvHsBYjr7MVT/hzAlhD4Ji883bFWjprumK/N1KmWqbdrvUZouFkIsDBYDKWLhzM9+ZmVzcae9wmMLRKftX/0vPU6XdfTDZzrfEy656xrWXlArZgryxD/FmftxVYcreQcxAiq2+cfc1z0zwuUFS6fZKkLWTo7Q5XM+HbieI+hxeLFzon2et0GkU+oJLVi2NriQREwtsmf+vCzLS5YRwh+aZRz9/ZeJZ++/Z+nZg35YtK0uXSpYvET1PxdyjHNtr4Y7PYpJBJLjrAB31Mms6TE2mhlSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729499884; c=relaxed/relaxed;
	bh=EcqUdzsTK2SxdYXe7X1yX1MP8kGD47O83QE6ASw27lY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A+XT3dzNQ1vU+RkyX5WS3vU+ezEpgWHYJgTdX80nOLnrQgnm/0TujloIdX45VqidNz8xZWHXgaoArY90YQYR9glqJOEf2hOCzVebttIZwBW6edcgOZ5VzIy7Cg2L8tXeywcewtH0BHaEDskhkzG/T4moe0cA0sAfDFuyehZUQ/WMWrw1F30D6cSbRzNOqsabitDyOakAgsjLcHUk5qv6px1eT6mt3sKbwd7mueZe1Vk0EdtHn9pJEzuhN1ChW9s0P8rM6U/lj1JEArx3/O/sV8NABqVmhjE2hEWxOZQP8tXPJTSCHtLNbBiBKqQPgzGGRrYYpmvZrIETnHVBtgrBsA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HsQGtSbF; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HsQGtSbF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XX7x64yS8z2yLT;
	Mon, 21 Oct 2024 19:38:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAbBaK72bwWJDdyEt0r6qqbvaSrw7cMubDY0SghuIPEKE2se4l3Hwwowxj6znggugUNZFDYw3AUbSShfY2ybIm+7PTmO4ln/SZaDUzRpO2UwAUXl++MYT8mVYyXdzc+B+7azyNdpGj8iJUjrQi5P5LUaLTqkQG4mQLCz3k4wAgzF29TAETPHOn0gthvfHTLrZp2Dtj+egAvaM9lqBXa2A87IhJAv+6HXEQq9z0ClLiEWYUNAt6SINqY6cb5p4RyVBvMmC+94h/7Np5xAekxDw4iw5tY9bgdk+YgrAS99SGtcnZhaQR7iUrgGzRZeKktl2H3RCSB+ViVyvUP8ZsjF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcqUdzsTK2SxdYXe7X1yX1MP8kGD47O83QE6ASw27lY=;
 b=GoaooFRz9e/1QQ5UsPdGod4WQJyCgS85+tTSjNp+zBxjh+ssNrrKGd4K3MPkoSOt+47s2NfOomDxKMrr/F77OcDAn7bFBjl8nu9i2DBGETvpR6vO6o+IMRf2QKuYEj3K1ekpZdCL6MZFpm/W7eFjZiQ9KRbf6LKkz1m5Bq/mgTclV5TC161Dgxl1SAoonYNe48dBFrYOzlEdvD+3p1IaEUiwnrA/cQ7kak76x8kOtkEJYvwmB/KLTJ5JK9Uuid2Zxhgf3+XcAMqVb0G07M5Cs+u4h7X/dU18sTIACVzg94c3xbOsvINgAoLaIaA3wrliv67Rz0wIxILB9OWit7j/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcqUdzsTK2SxdYXe7X1yX1MP8kGD47O83QE6ASw27lY=;
 b=HsQGtSbF6K8zU8owOY3ARkzUsvty1WfplRl4UnelwK5FSsCI+TuySQ9kw32mxOD4doBwWulmsRc1L9f5/WONDz4NskVadZ697c6XK1z1+Abc2THNxqcpk7kB5pMDAP1n5S+DBS/xMT9mkYNsoolQ1ICT0uMR+TJ0e2hZimo+S0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SJ2PR01MB8049.prod.exchangelabs.com (2603:10b6:a03:4ce::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.20; Mon, 21 Oct 2024 08:37:43 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Mon, 21 Oct 2024
 08:37:43 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v2 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt. Jefferson BMC
Date: Mon, 21 Oct 2024 08:37:02 +0000
Message-ID: <20241021083702.9734-3-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241021083702.9734-1-chanh@os.amperecomputing.com>
References: <20241021083702.9734-1-chanh@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13)
 To BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SJ2PR01MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: f010cfcd-5ea1-476c-7d3b-08dcf1aba1cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?OifcEP0TxdfJipyGL9gXAmMfb3qvxcTFIBh5p0ae1g2Djvkf1/nzxMqD7rJO?=
 =?us-ascii?Q?FVbP9j24GBxqlT5YMetB9B/tZ+LMFMLrx5H6b73za5+r8fTlLRws8IBoPZXG?=
 =?us-ascii?Q?wjTSRn7Xhw4Ovat0SmPn/EFbRy5kyJS6S/qfN5dZszc5P/bSGtoB1wbvLacb?=
 =?us-ascii?Q?oJJCbqDdKuwuh+fvwz7acC9lPqchSRIcexEIK6LCYAfVYj8NEFrNh+w7eI1x?=
 =?us-ascii?Q?PWa9whZea9goU6SX36QRmMfzOxsYayz6EtmsnAyJuSiSfUoaM7ZeIjNitpCS?=
 =?us-ascii?Q?JMvg9xQIxUCn/9wqKhDnBSOUejapnMUL4gEwgeo2FyW+eSAS+m4R9rjhexac?=
 =?us-ascii?Q?6UCbBu/K3DMkbBUjrL79VVIw3a7NTjNuimp+Hi1jTL8noId+aJ1ss9PNQZC4?=
 =?us-ascii?Q?6jq1sFHeWF9UB0koLdiyes9iBI04JQIPtwLyxGdSlzk8Rd0Hz6PU3XwKqfqC?=
 =?us-ascii?Q?FY2IC2INuG0gCvqu+wJUXTc0mXr4yTBjckeMkFIqi1Hq54RPnfLC/9djQJkr?=
 =?us-ascii?Q?4Bfp3qszilaFrDNqTSP5fr3BS5ClPGcF736FnFonxRHFSPMShq7wbBj2AFUI?=
 =?us-ascii?Q?oWIz4hw0CXfN4Ua6FATjqIo393vFmq3cnWeQH9XEmypfiSZ2znhSQtbzm8tz?=
 =?us-ascii?Q?j9xJAu98L25IGyGbLYELisRtWwTW7i2koXf7/ND9886FSxTF4boeiiT0vihB?=
 =?us-ascii?Q?2eQlgq8UYHWEARbh/11DnKw/Ome7lXjGY8qQZc5i856lsDx97rmxGVvSgab9?=
 =?us-ascii?Q?UowX/baKlYllL5VRaNV2jJW2W2YG37N5lEOgWkUSdXwaQSrvoODsFLwvh/vB?=
 =?us-ascii?Q?gVHsKf6CMpXBFnctsSSGApA2saLlxxVcBARZGXzTGajJ6EiCE+JZtBt+O18l?=
 =?us-ascii?Q?ES+ksb2X1aW/G2XPHq5BG7yKCMJfVp8VWNjogvww/wNOooK6nw1KoLJZJ7Xa?=
 =?us-ascii?Q?uerHOmxDHav7zfV2J34qfu8xkdSBsb+1Oj6NI2ClqtcezIwShjo0Wlgm28MH?=
 =?us-ascii?Q?eGBX5jIzwHH1MZQ4Kwwv6KWawgrB2u28eBL0C4V3h2NTXKVC+5+smaQhcFEo?=
 =?us-ascii?Q?kXMfvA6eTWTr0gzE2fq6S1KaXmO9QvJTezB1s2DXM9JnhrMSnPC3TTCgcsYW?=
 =?us-ascii?Q?agY5NWvt1rQgmpFxk9FQ3PSZOjAvoWOiUZAQcRz5LmtUCftxp5IwQT7T6GB/?=
 =?us-ascii?Q?0szwnECyGMMwsnUpdHLiOntXCv5Y16UgDrmf0CIgi/YCDWKVfCyD2xGkj0wj?=
 =?us-ascii?Q?mUdoRt+VTItG43oMWyTS3Jp8WM4M3S1l+fX+higBcF1pXBLcr7eSuUikc55u?=
 =?us-ascii?Q?gZs2Io7S4trnIwyxdv5UGCtuAxxL0NFLfBk3u/+JJYLbUkR+fplW3O9H6G7X?=
 =?us-ascii?Q?gL9mQcX40g+pUhSMaAoGq08Xvqhq?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yEmJzRElrgsYgWA5WxXSbxhXXstpihFJ8NLf/R2j8Rmh+J5OTRJse3EQX4dD?=
 =?us-ascii?Q?I11nNIXJxiNjJ0zLGBuo7VKvoHRaGQNV5nClVecBud6uVUzg3CnEC9JOXDd0?=
 =?us-ascii?Q?C5Q/FosaNRVuyn7ToNWwGGTczSMF5DDhJLJsSWtnV0tLV8mxSXdaE3ybhdoW?=
 =?us-ascii?Q?ClA3NO2kvoYK0vaW/536YDkxJxcvhdj5otWt89KA1cHmYanyFImjcBFEjYFC?=
 =?us-ascii?Q?CFYIhAkG72fZny5sPDL2jr+1Nw75nhVfyR0ciWAR9lyHCCroiJxBJK9HkHHi?=
 =?us-ascii?Q?q/gXLkNek9J8BcPTcHTfhyXkYsBAUHjT8w7B6fpzcWs1FToCHLOyBUuiU79N?=
 =?us-ascii?Q?dYILVXJgkFbKfpt6/KBJiTw9DpB3mNmForxUlTIEEVRePT2cDdwe5hy305eS?=
 =?us-ascii?Q?Rj2voKwZtGrI7oxYAzxQrTXt0+5aJkeLhvtSg4OEct2oEXLTpMkop4+2p3nZ?=
 =?us-ascii?Q?SMweRLBovAscMoODOHxyDsVypN+OMslNUZH+MEMCeGB6HTug3XGqdjgV8eez?=
 =?us-ascii?Q?PRq8TwHSfo877cjrZ7rTZa+z2N8n2Z0sucbRViHCmA7dnCaeKJurivtiQ7ll?=
 =?us-ascii?Q?Vk6HCZwsmvWWqOhyfjZhAiTwVBgoKkVRjecs/dNZq80qFxrubyDahn+3YepL?=
 =?us-ascii?Q?xnUrsfB/x4+BgNgB7cTVde94LQe4O+3R6imMWeEQQFJduaCHGwA3O5HEqCp5?=
 =?us-ascii?Q?6GNAvT1djhi1zx573OPny4TqYZzZl2aLdcTV1upDOy6nLzBrwc33gOue5zzw?=
 =?us-ascii?Q?VzQCb3oaiP92pn4V7iD0w5XflXJ+arPowyeHe+SAnzmKPdg1oBRceRUUNSPV?=
 =?us-ascii?Q?5g37eoweo339YqcoIC53xmzdrK/rifOudW+9NJRwl+SG5Leb12b7cBcLDUXl?=
 =?us-ascii?Q?5mECs5nS/DNbENh+t1no4RxFsmK9TRvqXiMOHMfbPRtL9+tU5feXUjrkN+5D?=
 =?us-ascii?Q?7cfhW1HBPTwmOhoI0TnguUq0xZ3ptmR4B6OjSBpfpz6vgqubZ6DLjk9jsyLg?=
 =?us-ascii?Q?gEvdnZf5C/irMx7iR2/b5zpqOmIzZ1ZcS93THyQt14k0DbruAFW08CIappsR?=
 =?us-ascii?Q?qgH8UVyvlS7iRyn3z/offEwxmg9+6q84xtLhGN/jydAtWyzwUyM/crhyHT+x?=
 =?us-ascii?Q?G0DLioyvq0bqo6TgvSVduRsJ5badmT2o7Msqk3o1BbfTrX85gVdn4YrkYEH6?=
 =?us-ascii?Q?BXY1Nq2GhMD3vlG+/1L7rIh6TXRm9cD6JAqpLYhv4c/SVfytazqeAjH2qOqm?=
 =?us-ascii?Q?tkccwC4yNwYOmcFb5YvmdTsio50ZyEGsNxJ0qA3i9I9eseXoISlxJQ9JGtF5?=
 =?us-ascii?Q?rY0oRRQclCmHT8JEXWgomlhkGvw19ihlFTGapKcP83U0iJQZVY4zUIUN9d/F?=
 =?us-ascii?Q?SSwa3gnN6tW+xGJ1raNlMNmqUXp2TdzjCB/jYvLKni9Hp6pnC8JJt+P6RZGt?=
 =?us-ascii?Q?WAfWB/M9YJWWvcIIrJzjTLDPv5LppgTUvof7CEGRk8QGCI7p6ZBHOL4twBS+?=
 =?us-ascii?Q?rqc9tdsH41jv/ogrClxg9+C25A1Cu8A5A4ArXU4U0Z8klv6YeZAb2KqdqbSL?=
 =?us-ascii?Q?dutRQUhvnyXzSQRpsq58Hzb+DCIoJ0fKO+GkSOvFKdzi53t9hjPO7eAwPKp3?=
 =?us-ascii?Q?lO4tNlfg9mdBSPUF9wvDd40=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f010cfcd-5ea1-476c-7d3b-08dcf1aba1cd
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 08:37:43.8093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8A/rgQTqwWJlwA4fWLjBXmLSXO3WcosoP8o4jJZ4EY4m6UbC2dzaHWUZim77WlgQsGeCBmO0DIJ6pRdcxYQm3bpp92VnSm7JICAc36D0hH4HuYh1779Ia4ejQpwq6l4g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8049
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Mt. Jefferson BMC is an ASPEED AST2600-based BMC for the Mt. Jefferson
hardware reference platform with AmpereOne(TM)M processor.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v2:
  - Remove the PSU node with pmbus compatible                     [Andrew]
  - Remove clock-names property in mac3 node                      [Andrew]
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed/aspeed-bmc-ampere-mtjefferson.dts  | 622 ++++++++++++++++++
 2 files changed, 623 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index c4f064e4b073..b1fb0853a789 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-amd-daytonax.dtb \
 	aspeed-bmc-amd-ethanolx.dtb \
 	aspeed-bmc-ampere-mtjade.dtb \
+	aspeed-bmc-ampere-mtjefferson.dtb \
 	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
new file mode 100644
index 000000000000..c435359a4bd9
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
@@ -0,0 +1,622 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright 2024 Ampere Computing LLC.
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/i2c/i2c.h>
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Ampere Mt. Jefferson BMC";
+	compatible = "ampere,mtjefferson-bmc", "aspeed,ast2600";
+
+	aliases {
+		i2c20 = &i2c4_bus70_chn0;
+		i2c22 = &i2c4_bus70_chn2;
+
+		/*
+		 *  I2C OCP alias port
+		 */
+		i2c30 = &ocpslot;
+
+		/*
+		 *  I2C NVMe alias port
+		 */
+		i2c48 = &nvmeslot_0;
+		i2c49 = &nvmeslot_1;
+		i2c50 = &nvmeslot_2;
+		i2c51 = &nvmeslot_3;
+		i2c52 = &nvmeslot_4;
+		i2c53 = &nvmeslot_5;
+		i2c54 = &nvmeslot_6;
+		i2c55 = &nvmeslot_7;
+		i2c56 = &nvmeslot_8;
+		i2c57 = &nvmeslot_9;
+		i2c58 = &nvmeslot_10;
+		i2c59 = &nvmeslot_11;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		video_engine_memory: video {
+			size = <0x04000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		vga_memory: region@bf000000 {
+			no-map;
+			compatible = "shared-dma-pool";
+			reg = <0xbf000000 0x01000000>;  /* 16M */
+		};
+	};
+
+	voltage_mon_reg: voltage-mon-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "ltc2497_reg";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-bmc-ready {
+			gpios = <&gpio0 ASPEED_GPIO(W, 5) (GPIO_ACTIVE_HIGH | GPIO_TRANSITORY)>;
+		};
+
+		led-sw-heartbeat {
+			gpios = <&gpio0 ASPEED_GPIO(N, 3) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-identify {
+			gpios = <&gpio0 ASPEED_GPIO(S, 3) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-fault {
+			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels =   <&adc0 0>, <&adc0 1>, <&adc0 2>,
+				<&adc_i2c_2 0>, <&adc_i2c_2 1>,
+				<&adc_i2c_2 2>, <&adc_i2c_2 3>,
+				<&adc_i2c_2 4>, <&adc_i2c_2 5>,
+				<&adc_i2c_2 6>, <&adc_i2c_2 7>,
+				<&adc_i2c_2 8>, <&adc_i2c_2 9>,
+				<&adc_i2c_2 10>, <&adc_i2c_2 11>,
+				<&adc_i2c_2 12>, <&adc_i2c_2 13>,
+				<&adc_i2c_2 14>, <&adc_i2c_2 15>,
+				<&adc_i2c_0 0>, <&adc_i2c_0 1>,
+				<&adc_i2c_0 2>, <&adc_i2c_0 3>,
+				<&adc_i2c_0 4>, <&adc_i2c_0 5>,
+				<&adc_i2c_0 6>, <&adc_i2c_0 7>,
+				<&adc_i2c_0 8>, <&adc_i2c_0 9>,
+				<&adc_i2c_0 10>, <&adc_i2c_0 11>,
+				<&adc_i2c_0 12>;
+	};
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac0 {
+	status = "okay";
+
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&mac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+	use-ncsi;
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64.dtsi"
+	};
+
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "alt-bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64-alt.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+	bus-frequency = <1000000>;
+	multi-master;
+	mctp-controller;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9545";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		i2c4_bus70_chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			eeprom@52 {
+				compatible = "atmel,24c256";
+				reg = <0x52>;
+				pagesize = <32>;
+			};
+			temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+			temperature-sensor@49 {
+				compatible = "ti,tmp75";
+				reg = <0x49>;
+			};
+			temperature-sensor@4a{
+				compatible = "ti,tmp75";
+				reg = <0x4a>;
+			};
+			temperature-sensor@4b {
+				compatible = "ti,tmp464";
+				reg = <0x4b>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				channel@0 {
+					reg = <0x0>;
+					status = "disabled";
+				};
+				channel@1 {
+					reg = <0x1>;
+					status = "disabled";
+				};
+				channel@2 {
+					reg = <0x2>;
+					status = "disabled";
+				};
+				channel@3 {
+					reg = <0x3>;
+					status = "disabled";
+				};
+				channel@4 {
+					reg = <0x4>;
+				};
+			};
+			temperature-sensor@4d {
+				compatible = "ti,tmp75";
+				reg = <0x4d>;
+			};
+			temperature-sensor@4e {
+				compatible = "ti,tmp75";
+				reg = <0x4e>;
+			};
+			temperature-sensor@4f {
+				compatible = "ti,tmp75";
+				reg = <0x4f>;
+			};
+			temperature-sensor@28 {
+				compatible = "nuvoton,nct7802";
+				reg = <0x28>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+				channel@1 { /* RTD1 */
+					reg = <1>;
+					sensor-type = "temperature";
+					temperature-mode = "thermistor";
+				};
+			};
+			adc_i2c_0: adc@14 {
+				compatible = "lltc,ltc2497";
+				reg = <0x14>;
+				vref-supply = <&voltage_mon_reg>;
+				#io-channel-cells = <1>;
+			};
+		};
+
+		i2c4_bus70_chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+
+			adc_i2c_2: adc@14 {
+				compatible = "lltc,ltc2497";
+				reg = <0x14>;
+				vref-supply = <&voltage_mon_reg>;
+				#io-channel-cells = <1>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	status = "okay";
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			i2c-mux@71 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x71>;
+				i2c-mux-idle-disconnect;
+
+				nvmeslot_8: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x0>;
+				};
+				nvmeslot_9: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x1>;
+				};
+				nvmeslot_10: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x2>;
+				};
+				nvmeslot_11: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x3>;
+				};
+			};
+
+			i2c-mux@72 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x72>;
+				i2c-mux-idle-disconnect;
+
+				nvmeslot_4: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x4>;
+				};
+				nvmeslot_5: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x5>;
+				};
+				nvmeslot_6: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x6>;
+				};
+				nvmeslot_7: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x7>;
+				};
+			};
+
+			i2c-mux@74 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x74>;
+				i2c-mux-idle-disconnect;
+
+				ocpslot: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x0>;
+
+					ocpslot_temp: temperature-sensor@1f {
+						compatible = "ti,tmp421";
+						reg = <0x1f>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						channel@0 {
+							reg = <0x0>;
+							status = "disabled";
+						};
+						channel@1 {
+							reg = <0x1>;
+						};
+					};
+				};
+
+				nvmeslot_0: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x4>;
+				};
+				nvmeslot_1: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x5>;
+				};
+				nvmeslot_2: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x6>;
+				};
+				nvmeslot_3: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x7>;
+				};
+			};
+		};
+	};
+};
+
+&i2c6 {
+	status = "okay";
+
+	rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp75";
+		reg = <0x4f>;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+
+	fan-controller@5c {
+		compatible = "onnn,adt7462";
+		reg = <0x5c>;
+	};
+};
+
+&i2c9 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+	};
+
+	eeprom@52 {
+		compatible = "atmel,24c02";
+		reg = <0x52>;
+	};
+
+	temperature-sensor@18 {
+		compatible = "jedec,jc-42.4-temp";
+		reg = <0x18>;
+	};
+
+	temperature-sensor@1a {
+		compatible = "jedec,jc-42.4-temp";
+		reg = <0x1a>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+	ssif-bmc@10 {
+		compatible = "ssif-bmc";
+		reg = <0x10>;
+	};
+};
+
+&i2c14 {
+	status = "okay";
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+
+	bmc_ast2600_cpu: temperature-sensor@48 {
+		compatible = "ti,tmp75";
+		reg = <0x48>;
+	};
+};
+
+&i2c15 {
+	status = "okay";
+	gpio_expander1: gpio-expander@22 {
+		compatible = "nxp,pca9535";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"presence-ocp1","presence-ocp2",
+			"","",
+			"","",
+			"","",
+			"","",
+			"","",
+			"","",
+			"","";
+	};
+};
+
+&adc0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default>;
+};
+
+&vhub {
+	status = "okay";
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+&gpio0 {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","cpu-type-detect","i2c2-reset-n","i2c6-reset-n","i2c5-reset-n",
+	/*B0-B7*/	"","","","","host0-sysreset-n","host0-pmin-n","fru-rd-complete",
+			"chassis-id-sel",
+	/*C0-C7*/	"s0-vrd-fault-n","","bmc-debug-mode","","cpld-3v3-irq-n","","vrd-sel",
+			"spd-sel",
+	/*D0-D7*/	"presence-ps0","presence-ps1","hsc-12vmain-alt2-n","ext-high-temp-n",
+			"","","","",
+	/*E0-E7*/	"eth-phy-rst-n","eth-phy-int-n","","","","","","",
+	/*F0-F7*/	"s0-pcp-oc-warn-n","","power-chassis-control",
+			"cpu-bios-recover","s0-heartbeat","hs-scout-proc-hot","s0-vr-hot-n","",
+	/*G0-G7*/	"","","hsc-12vmain-alt1-n","","","bp-cpld-program-en","led-fp-sta-gr",
+			"led-fp-sta-amb",
+	/*H0-H7*/	"jtag-program-sel","jtag-cmpl2","wd-disable-n","power-chassis-good","","",
+			"","",
+	/*I0-I7*/	"","","","","","","power-button","rtc-battery-voltage-read-enable",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","reset-button","","","",
+	/*M0-M7*/	"nmi-n","s0-ddr-save","soc-spi-nor-access","presence-cpu0","s0-rtc-lock",
+			"","","",
+	/*N0-N7*/	"hpm-fw-recovery","hpm-stby-rst-n","jtag-sel-s0","led-sw-hb",
+			"jtag-dbgr-prsnt-n","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"ps0-ac-loss-n","ps1-ac-loss-n","","","led-fault","user-mode","jtag-srst-n",
+			"led-bmc-hb",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","identify-button","led-identify","","spi-nor-access","host0-ready","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
+			"host0-reboot-ack-n","s0-fw-boot-ok","host0-shd-req-n",
+			"host0-shd-ack-n","s0-overtemp-n",
+	/*W0-W7*/	"ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
+			"bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","vrd-prg-en-n","","","","host0-special-boot",
+	/*Z0-Z7*/	"","ps0-pgood","ps1-pgood","","","","","";
+
+	ocp-aux-pwren-hog {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "ocp-aux-pwren";
+	};
+
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0-18A7*/	"","","","","","","","",
+	/*18B0-18B7*/	"","","","","s0-soc-pgood","vga-ft-press-n","emmc-rst-n","s01-uart1-sel",
+	/*18C0-18C7*/	"uart1-mode0","uart1-mode1","uart2-mode0","uart2-mode1",
+			"","","","",
+	/*18D0-18D7*/	"","","","","","","","",
+	/*18E0-18E3*/	"","","","";
+};
-- 
2.43.0

