Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9319973CA
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2024 19:52:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XP0pB59NFz3c3g
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2024 04:52:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728496335;
	cv=pass; b=m6YKETXk4agEVjSO/3GNOdg58Sts+shFwI3cFV0OpbRb9Vh7WDbeSpBizFRNSUdKb8ZrFCX1f3pzL1yJLTHcdIAuzGePZIx34Jn87JDsgXxZFtRlu6ZO+6uLS2OYdmBF2pilMmlndGhKD89AdNbvMEy9w03ziBSkdjFbqKIWanCnw7xuVwcKBNvjzgtLI0DT1jzKzIsFMg6cqPFRuRuXAjDO1deNJYyfM3y+BwxkhALOS2bbQwCIVJj1WPfaf6zJVmJpEGhCp9WSX6Wv53ihR+IUKMVFjVtGu9XmLvs/jWhP4V12hVyjTeC3J1XTRoEGoYMD++dtF6S/AdNY8Ly9xg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728496335; c=relaxed/relaxed;
	bh=O13M/Yk4iobw6dk8zoKwoWa0/33zsiIXR20yhJ4QYho=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=b6a6g1BMxUt7xM9WBXlmA2geHeWiGve5AJIjBfxrw3VjspBKX9SeXLN4CfOmUSSl9FjkvnP1P9DPWql3yHdQOCoIs+EzaLfEAdeTP5nFaszcJt+DpA2Fry/WkC/+mn/650KMcGWEZTsG7nGVGWp8cZX2KVCwPo0UK0TQto/S+j8VqWU40bSi8SWmpjLXvCsYE9coA47FNyJ3iW/3qdh+d3m3t2ogFFMevG+dgqIkMdf4jx0ck+WFSvybKrFPEGdmUCsPnqOF/VHBEsF7D7z0C9advLVNSDZm+2pv9k8f4p0G/lR5NGeEvBPSj4uyRJYPRQHmPe/ElWMmAT3IMQvgSg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=smartm.com; dkim=pass (2048-bit key; unprotected) header.d=smartm.com header.i=@smartm.com header.a=rsa-sha256 header.s=selector1 header.b=HNTfk19a; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c105::1; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=rajesh.ananth@smartm.com; receiver=lists.ozlabs.org) smtp.mailfrom=smartm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=smartm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=smartm.com header.i=@smartm.com header.a=rsa-sha256 header.s=selector1 header.b=HNTfk19a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=smartm.com (client-ip=2a01:111:f403:c105::1; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=rajesh.ananth@smartm.com; receiver=lists.ozlabs.org)
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XP0p174Z1z2yRC
	for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2024 04:52:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6iz3/AApE7pbz9iasndttc+9FpKVp8VIvnGoIOlhIVougeOY8ZudF6rZOrE+Pb8k59o5I2TMwryCIteYLXWf7/p+80Tcy92yNzX9UJ8kkYGYHZ1oVOdQUHAy1FQQ8I9mWtjtf1AuXqu/FYmt+caxwYlD7HKLcqbz/mORUh4pAT9+HU55wEQZMuLImhbQ5isyVNFvgg4fgyFX/W1uKcbagcToafOL85C4djUX/VMT5blVoHUyKg4D+yjmWWyOynN/Z2NlPL+4NYU85wBq2OLI/pD0RVdsX2N9BaI+msJfWPHrQ+YSVVOqFPtcAQi2i2eXOMeO1yqhEweOwYeui30MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O13M/Yk4iobw6dk8zoKwoWa0/33zsiIXR20yhJ4QYho=;
 b=NJDG/CsqB74lSb6T/vv8/XGQip+NQCJIFh3gKAP76YAKnk6LYXcBws6/FZmAbC9ImGadp3i0DHLYY0Q+QVwkT101+IXj7V78nKF1RDbpPq+EpWTHrjfQPaRPvourGaTB8Zwu875y6QaiB99vdY9RGQx2YBaaEJLxxwEWxC5yXvNRUNerYrIf6H6sj1vcYNoC/RdYIIwmsX2X/skTCSqoL97H4GwpQnAiwyKsXLjgO62i31QXs1t96ELgDZrdSDgNoxtZFa32QVyI3GEekrtYmZzD/5eoITAa5qUy6StDoAHlh5WfuVTRqMgmC7PKm7+fRoxaEFWkgcJSbwdui9F/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smartm.com; dmarc=pass action=none header.from=smartm.com;
 dkim=pass header.d=smartm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smartm.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O13M/Yk4iobw6dk8zoKwoWa0/33zsiIXR20yhJ4QYho=;
 b=HNTfk19aSHvExKQv8tfLAtAUIoe8wf1L+zDrKA0Lskf6oReInDjvFpO6pYuiZoCEgjthGDWIg7jJBuqsQaCY26+W1b+H+JEMcqbyRtKFMejCYmwXLmUkoGOK6XUrIrUwB0bOPeuFz+cuW8+pZbryhfHZVAY07cbpNe9WyROpLGxmrJ5F7B0MbPyxd5UOKWm/ZmrOz10wz586qaEnMRgMDlHAho9euqtF/5YIDEIZk8lV8KVy5MwjdrGPKb7PloKREQeH9MOYQapUEo6DDePImYlFJc/1gAW7/N/F3OSxTYzTBV/ASmfoPW2Nlv7sjH/Ot3mJ0g83Xc9gOls8HWeO0A==
Received: from BN8PR04MB5906.namprd04.prod.outlook.com (2603:10b6:408:a7::27)
 by CH2PR04MB7110.namprd04.prod.outlook.com (2603:10b6:610:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 17:51:31 +0000
Received: from BN8PR04MB5906.namprd04.prod.outlook.com
 ([fe80::15ff:a949:91cb:8bf3]) by BN8PR04MB5906.namprd04.prod.outlook.com
 ([fe80::15ff:a949:91cb:8bf3%6]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 17:51:31 +0000
From: "Ananth, Rajesh" <rajesh.ananth@smartm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC validation kit
Thread-Topic: OpenBMC validation kit
Thread-Index: Adsac2AkK6xgrMlWTxObxKyubMCHrw==
Date: Wed, 9 Oct 2024 17:51:31 +0000
Message-ID:  <BN8PR04MB5906400DF066DEA14E17A7C7947F2@BN8PR04MB5906.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smartm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR04MB5906:EE_|CH2PR04MB7110:EE_
x-ms-office365-filtering-correlation-id: b75c8620-12bc-4cf8-9d66-08dce88b0217
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?TtB1m8/2Eep7FRgyyJv4KdUrP1PS7f756+hY2mBu6Jb8l5h25sC+S+efrY02?=
 =?us-ascii?Q?qFM9kABTBA02lTPjo8xkfPZUsLuhZz0Wvjso7m2Tz0Z3aV0A7VERDlwYE6h2?=
 =?us-ascii?Q?rMcDk28rJ4Lh/T1To+sKsX8CD1+8oBUj71eInzn2SJAB2tweoCbFH7TsIwHJ?=
 =?us-ascii?Q?edS9FLz6NpPpePsyaaovQwv6JI2rGPwJ09I8svnMVIsmcgXLLZDWlZu30q2k?=
 =?us-ascii?Q?c0BrBSsrOPjFtBgK4IL/JOmOqAlkCriht7hhxCzCbcXZ49yRAwKKkaihEeGP?=
 =?us-ascii?Q?gJvl0mkvp+qTmQal22NNKoBRvcZ3F1WyMCyNukE788aSqAsHqrP/YC38n5TR?=
 =?us-ascii?Q?4e9g9E8XJ8ue2Cw6wIcxfBWTdJaVs9/JH2cpnGFQGbQ4TgAZpfxlOtRybRih?=
 =?us-ascii?Q?KSBf+pvTFClrcBFAFKOHHvlR6BgynHbW5FLXSPOV9jsRlpRM1kQikBI8etHE?=
 =?us-ascii?Q?jy1O8yRRFc4qXHeopsLcRLHBBUz1hvalR0JOvXwf/8IKSRevJIdgs1JEEFs8?=
 =?us-ascii?Q?+CVrndb8bOptP/0zjH0GNAapyOkB8T3/+B6E9FQhu1NIhwhgyOcXk0UFgfCR?=
 =?us-ascii?Q?PKirszVEg0VwLsi5SUAfvCbbvR5ryHJsuZPOHAeaxdzlWfagxxyQWakb7TLf?=
 =?us-ascii?Q?eahgL8pyZI4bHEMSOOzVvnTFaj3LzxaCTrTvV3M8CBQDVO45BanROpuMgEK/?=
 =?us-ascii?Q?2nut5lw8y3ttGCj65z0BXFx7/LhCHMch+3pnq0XCoOnbCA28l35PVNhVR2jr?=
 =?us-ascii?Q?TCthv8bgkff3cojwXLEf2pSMr8J1je36Brq3AGy5AADkY2fq5JJf4tTpBYGh?=
 =?us-ascii?Q?+Ausbi08Zhv08jqZdgczakOnf8hmdXmAW6gr38C6mtMYIIuQ1t5lxjEHguZt?=
 =?us-ascii?Q?Qv9RQtGwzaoKGyfDBvLBfn/mBoPsczLtnEwpcDoWdKOu+kzt3iXvr357V2WL?=
 =?us-ascii?Q?WzlKAiX+FdwbDlJJ3FCvmUnF1AwzYW9PgYDLonVzlBFid1QIdAZbBs3EpG8W?=
 =?us-ascii?Q?rahDCMlTxlR5txEmXgzECS9MXFOXkxlJIn2aFQzJDJP/F26r1WnZIM3XL7Jy?=
 =?us-ascii?Q?tfy2w9idLA/ILNzPlepgw36MBVLolBtJJc6K1xy62gdj2OJXs/Jbz3RHmgVt?=
 =?us-ascii?Q?GVtdDEkGvWW91KJ+JqQ7I50tS/u7RoDJ3M0ROkLT15TD5/Be9U3PNcWi0LtV?=
 =?us-ascii?Q?S4qbk84MPuG+We8kKofUW8nAiKVm+tvINxKd2b70hc3J9mTKtJYQso7dK775?=
 =?us-ascii?Q?luUwZFHolQyZAEFZ/e2VTcdbQnSTh05nQuBoyG7h2ziog5VIDJ2O7dH4glMc?=
 =?us-ascii?Q?0hGRMUFORDnbkFVL9kDXfsqOfDzcVaSWy/qe8GUP0I91nw=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR04MB5906.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?tCSXoFeltYOqXskIqQFsP53XwTV8lJZy4lCenMYU66SkcdrZUaraoDgiogXo?=
 =?us-ascii?Q?SVZkFI2cU48/xyvrjMvYXFmsleepGfc/RABggyYkAkn+h+cvsM1L1mIxosWT?=
 =?us-ascii?Q?fMHD6u3zCsMMLwkOx9k2PDwr35two1g1L73F0mvf/hP1N5rzeVewzM39/OWW?=
 =?us-ascii?Q?DCH6nUFXgzCMitdAhU2e3dwuBXi7309mdIfkEU4s8konJbKRpE2O9jhq88Kb?=
 =?us-ascii?Q?RczZMlUyZGiySYvTwU8cNUhcUJfFIkGzQ/ikJwPcgTyz37VkLZNqsJflYHLY?=
 =?us-ascii?Q?n0+Zy3ynRJhV5KEy06oXMmqkp0vbidofmyTlu3RQeRsmaqnhvRtG/m7rpg9o?=
 =?us-ascii?Q?87uCcAXqLHP5ZdNyFietktkOx8V1NS1dO9i9J57pm/ewbPpTi/t9ej0KLR8/?=
 =?us-ascii?Q?2sFvsF7LxpsKI6JHCZFvolATIcnKkJUmhH5MKBqi2HlBPKWxhN2rClfpK9VF?=
 =?us-ascii?Q?VvTezosJSDOunnAO+mU0zzJQemyg3hvpihjgdfh08nVjvuHRVfvLvWQULGwf?=
 =?us-ascii?Q?tfgWYBxm0tjCgawNpNB/NvaLXHFrhDwDloTMUyWvJ/N+Ye3Ga6SmJ2eiDnMb?=
 =?us-ascii?Q?DAnFkCPfARlfuznNYC7t1RYmbBIMorZl/8sVNF2ef+ucgsDYl+1StPONjxmC?=
 =?us-ascii?Q?wNtaAi6MSV6knuS5XyeVZcjG5YxVXD7hnDNLqqpFDJMEijuP1DtZ7QdLcjTS?=
 =?us-ascii?Q?aHTzgsi+633E3KUi2rN19uQmpoH212Vd/Pq1KFxbNsj/AjyfmU6gMSpywdAP?=
 =?us-ascii?Q?CA28ZWIi4q8BH8AZ78JXLp4H7Yf37fSe9vsqqxbD0fONT1q0t9utcdI5aHa0?=
 =?us-ascii?Q?d0CoL2Ye9OdAp49JGVLWcTmCtbUAGvlxg4cd9NPpNhPyTfvMFL/i/2xct/hq?=
 =?us-ascii?Q?KhoKwLUJ4ojYRcH64qesRF0BX9flNgRetmtIt7AcQP+QjudOriuHU08r9CBr?=
 =?us-ascii?Q?qcP3SB8vsZKBO+NuKX9d1+6lMMRcKhBBuF3rZI0z0eP6RW6jPQ38iYB+kd63?=
 =?us-ascii?Q?FfNXZC9QhvsIhk2qD+EzTxS5OO9AxaDcDIj+AiXjIfz3UvckBKzPlDN8q+YR?=
 =?us-ascii?Q?oiuXfueVQjIPYSlWEYArTpyZQ2v4ChKJYiepAR1HvYGtL1Rl4An00cSdYo+N?=
 =?us-ascii?Q?H1kE3aU9L2fRYlF0eYp6Av/Hj1nNIgZzKhhT3NDS7k1+d9UUqhJiMH5IYWSc?=
 =?us-ascii?Q?yp7/BPaodFy1yVchEjnqBBeTEBPD5xpYamOnjjfZLPV8JSBCcvVMeXuEFp0a?=
 =?us-ascii?Q?D5JgqDTajAJa/0WMLnPB4llfIwJRlDxw0dLUehOIWhbnh1UYzkW20isICM6D?=
 =?us-ascii?Q?r5KdUqhShUwstDvrtBbMK2dtaGR/P/mZ7SRGscV+FycZNTJrgA5qi+yVQffQ?=
 =?us-ascii?Q?hwsC6cW8dDKOjzu3KFMLQ3VpI6wkvORLE0003wJ9CjQd4FpOCDdKJ15xT5EM?=
 =?us-ascii?Q?if+ZBAY+WpGcljTQAdWB6xBXyIBBhYMx2oYwtQU77YpwuDsFTIfkCwa6R0u6?=
 =?us-ascii?Q?FEgLJLBUbFBJRB36bXo4KLHHHAayadedEp5xeBB+FYqbHoHoZrcgIhZfUXOS?=
 =?us-ascii?Q?XK12bC0l4SxYNvE1ISLIp7u1KK4yDBRuRJfLTfG4?=
Content-Type: multipart/alternative;
	boundary="_000_BN8PR04MB5906400DF066DEA14E17A7C7947F2BN8PR04MB5906namp_"
MIME-Version: 1.0
X-OriginatorOrg: smartm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR04MB5906.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b75c8620-12bc-4cf8-9d66-08dce88b0217
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 17:51:31.2622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0fd7909-cd13-4779-b0f9-5ced6b7a2c68
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nc6L9uAgt/qyZ5ru33wnYGoFXa+RvFQsRD7kXbQzgkqKauvpaTX6YaBdjNmyNrpfr3YuwZZWYHOcM4rU6ySUSrZw3n5JzovgKQRQ5/A4D7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7110
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	HTML_MESSAGE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BN8PR04MB5906400DF066DEA14E17A7C7947F2BN8PR04MB5906namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,


For our PCI-e CXL controller cards, we are looking for OpenBMC based soluti=
ons that could give us MCTP over Smbus/Pci-e VDM, and the suite of PLDM and=
 SPDM tools for our product validation.
Our PCI-e CXL controller card supports MCTP (over SMBus and PCI-e/VDM), PLD=
M, and SPDM protocols. We are in need to set up a testing environment.

We are in need of a OpenBMC kit/platform (preferably ASPEED based) that cou=
ld be used for our validation purposes. The available ones we looked at do =
not have the software stack we require, and we don't have any expertise in =
building on our own.

What we are looking for in the OpenBMC image for the kit:


  1.  An integrated OpenBMC image that has the MCTP support to recognize ou=
r CXL controllers over SMBus  and/or PCI-e VDM.
  2.  An OpenBMC image that has the DMTF standard PLDM tools (pldmtool,  li=
bpldm etc.,) to validate the PLDM functionality in our CXL controller card.
  3.  PLDM Type-5 functionality to validate firmware update is our main req=
uirement.
  4.  An OpenBMC image that has the DMTF standard SPDM tools for security v=
erification.

Thanks,
Rajesh

--_000_BN8PR04MB5906400DF066DEA14E17A7C7947F2BN8PR04MB5906namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:-apple-system;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"PMingLiU",serif;
	mso-fareast-language:ZH-TW;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:191769956;
	mso-list-type:hybrid;
	mso-list-template-ids:-1427634390 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"mso-margin-top-alt:7.5pt;margin-right:0in;margin-bottom:0in;mar=
gin-left:0in;margin-bottom:.0001pt;background:white">
<span style=3D"font-size:10.5pt;font-family:-apple-system;color:#172B4D">Fo=
r our PCI-e CXL controller cards, we are looking for OpenBMC based solution=
s that could give us MCTP over Smbus/Pci-e VDM, and the suite of PLDM and S=
PDM tools for our product validation.<o:p></o:p></span></p>
<p class=3D"MsoNormal">Our PCI-e CXL controller card supports MCTP (over SM=
Bus and PCI-e/VDM), PLDM, and SPDM protocols. We are in need to set up a te=
sting environment.<o:p></o:p></p>
<p style=3D"mso-margin-top-alt:7.5pt;margin-right:0in;margin-bottom:0in;mar=
gin-left:0in;margin-bottom:.0001pt;background:white">
<span style=3D"font-size:10.5pt;font-family:-apple-system;color:#172B4D">We=
 are in need of a OpenBMC kit/platform (preferably ASPEED based) that could=
 be used for our validation purposes. The available ones we looked at do no=
t have the software stack we require,
 and we don&#8217;t have any expertise in building on our own.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What we are looking for in the OpenBMC image for the=
 kit:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo1">An integrated Ope=
nBMC image that has the MCTP support to recognize our CXL controllers over =
SMBus&nbsp; and/or PCI-e VDM.
<o:p></o:p></li><li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo1">A=
n OpenBMC image that has the DMTF standard PLDM tools (pldmtool,&nbsp; libp=
ldm etc.,) to validate the PLDM functionality in our CXL controller card.
<o:p></o:p></li><li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo1">P=
LDM Type-5 functionality to validate firmware update is our main requiremen=
t.<o:p></o:p></li><li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo1"=
>An OpenBMC image that has the DMTF standard SPDM tools for security verifi=
cation.<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Rajesh<o:p></o:p></p>
</div>
</body>
</html>

--_000_BN8PR04MB5906400DF066DEA14E17A7C7947F2BN8PR04MB5906namp_--
