Return-Path: <openbmc+bounces-940-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FA7C87AD5
	for <lists+openbmc@lfdr.de>; Wed, 26 Nov 2025 02:20:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGMFK515Rz2xQs;
	Wed, 26 Nov 2025 12:20:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764120037;
	cv=pass; b=D1rZLh1nAcONJxPyS3COxFeQ93/3NF4Vr2KYNRSDAexwRLaonazBVod0lrYU6ox/3IyG/dJmErcP3bD70kgCbiGj2wRL8MhWLJ1HX6BPh1qzl2pUZwzglrKMVdQjCYWubarcK3cb+qQB6CjV1eRFAq68BE0rek8nz7cKKqbGSyrjM5CX1ym9kUmW2/WwDLjMiIa1yusa7RAlx3/pIBI+rutB9HvXYvFlHp4waK4aYzsGTZtrJkaDI/nNkOjFScRyc8IzVQ8W/9G7nQsUOtS1L5bfgB3THe0bQFZotRlMnsOXwCEx5+qHlqYKLgXrBJTlWei6s2NUElZM+azSWr6yFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764120037; c=relaxed/relaxed;
	bh=oZ/9wODNWlC8G4KDq7wrVHTTB083gtTVMKQ9jJOZG8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PYaPikQaJZCv7tB2Bu6+O5/1ej/HyL7a1wSZNTdClZWOyfwtUs1r23yocZyQd7ybSOwx04JjcQZhFpc4VB5SfZm035YZuuNm2G6dD+UlqUzYJo+R4oDQZghYHsa9aYM+MBD1zz9sTZA0uWCNzp4pluentzyZq20IASnEfbjEXjKFj4kSQn02ZqEEYk59DTqSHrqP8axI6VgS3fOS0J8b8PCXOYsAVF8UYlnqFpZ7EORHW6K5wDBQ1yqjf0Y8k9gqlwRcQrMXz9SPnu0AvV3s+bfZnWpzgtyZK0Q/BfX7KITem0YrGJ073jFEehbCFodxk64dCvxv1WdV8U4k6B7NCg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KqVpxaCV; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::9; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KqVpxaCV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::9; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170100009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGMFH73bqz2xPy
	for <openbmc@lists.ozlabs.org>; Wed, 26 Nov 2025 12:20:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/TCPVA3MLqHHCgDM5RDmJY4XqI+ty75aYx5DxKcV0ohSQpt9J4lydHUNh5iiJZZDvn5FLGhP4QHwNa6Z9fn/UCrSUZM4NyvbIOvvH/UkmU6WaZ9MvwPAX2CU+khYk7un1fxMhlLKQWA6NJDey8ZxDDCBhWkILJFbCQ6YZbHmc3d9gNQh6aVF/HyeADWDa6UGZI4oSfa9rBqiS5r+8cminOT18r0IVqNvWNjX53vWTRjg5En0kPPzZFoeg3Idq/hSb564mFjIoMJ8cMWM94UoD9Tm2veneFbCTrRzq1RxXOSSnxc9ty361q+d4LsfQ66lZGcs7c+zcCcULYnvtdCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZ/9wODNWlC8G4KDq7wrVHTTB083gtTVMKQ9jJOZG8k=;
 b=o8nc9ww1inrAXzCAf6y0l11uSV2oB4ybO+E4kc13zpM1ZEXHjJCwyE4PSZcGPREQ3qyNTO0Mx+TqkoF1MV6dt6hcySFfYNsjZrinKNyiHVh/2bjZytF+oPrvtSCkSumZGoDg8VaTXHLkI07dwizUcb4HG2KTUEB7JGwuM+4geGzxNLfC7T7Sv1F8lZBiNBgnxfBRtsMITron7xHFsaGINM9r0EzHfhfwSYJFpqN5JPylb4h172V5KWoZXgZHKtBjPLexQkCmCB3Udei/icEcSDGeQbmj/Jusb/+9PoQpuXoYIyyB6adQXfBjgyowQOWvwv6XYgfWht9UtaLUPFSwwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZ/9wODNWlC8G4KDq7wrVHTTB083gtTVMKQ9jJOZG8k=;
 b=KqVpxaCVyYIcD7V8dqg/xL4aZdxB2JfraKCNWfBqzLMkzhb2WexwusZwPqNsTsRZmo84uJinYSYjzyLg+HBxI1D5eyTqq2lrakWt6Qwxr4iD9nNKYqAp4e7+xSx7O2Q/DKq9xhVv9W6sAKcF5htTxFt7SQeLTBv3Fc0VCFMxXftKX6UZiCLqlFl4TbMCbXgBswD5bkLQtcLPc7h5kaEoAKcnfxKZevkN3g4u11CF8/N5XtnUOkh5d2ecG4Dh4O42ejHp8U4YRu6rHkSsCww+L3LpknWIrfSEViMHw5NZXdB3Z4+mHbX7XntsvrGch8M3fE+La+W1hB+6qmOnvAgihQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by MW4PR12MB6755.namprd12.prod.outlook.com
 (2603:10b6:303:1ea::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 01:20:08 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:20:08 +0000
Date: Tue, 25 Nov 2025 17:20:06 -0800
From: Marc Olberding <molberding@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot 0/2] aspeed: Add support for msx4
Message-ID: <aSZVxjFQ0+pqc/hq@molberding.nvidia.com>
References: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
 <127d5cd2b57bfd88402a27e5e03ac807d115c2cf.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <127d5cd2b57bfd88402a27e5e03ac807d115c2cf.camel@codeconstruct.com.au>
X-ClientProxiedBy: MW4PR04CA0166.namprd04.prod.outlook.com
 (2603:10b6:303:85::21) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|MW4PR12MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b3162da-c893-4008-bc72-08de2c89efeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TcxUw8uraZfjgZ61iSIe8TPxV0afCcaUVpEQST1SJKnZWB7eKYf+nor+05JT?=
 =?us-ascii?Q?4xJPF0QYMACqiVFvrGjdgUZ9nu9pr6I80d1bky0Gd0CdUcrrUJRodmturJ8H?=
 =?us-ascii?Q?Mp8RZa6RWE3/O/CiNO9D7BisQSilN+y4WPJ7GdFbDTJanmwSFH8wKPPjQtub?=
 =?us-ascii?Q?DrrZUX1zOfWhtWxXgsHF3UGDQcP766Xe3h2TGuAC5OivRfAo2BeZGf2gjAY8?=
 =?us-ascii?Q?/nmrl7Z4oNRN4nTeiOdkUDXh0HYAsqIOUpg4POGHpMFnTGf7sGRARitd4vlY?=
 =?us-ascii?Q?5ZUkAxC61BrUBrWo8cQpd28J1K2hxOXBNpeFU7JUilQdsbBgMcdlPUbFklLu?=
 =?us-ascii?Q?IY4QV9rcutlT+ARMQ3xsp+ghZO74VzTYGkVchXKULEfY9W3qJM0VbSlO3692?=
 =?us-ascii?Q?e8rj6UvG8PRW694klX/wipQ5Gsp8yY7TSHC6sl2G8NR/FyFWXj53g6b0q7SY?=
 =?us-ascii?Q?TYsqlsIuQbTdgGRkoBJTKvpYE61Yqk8/hF2OGKKl32XIzVphRS4S/C8Zwx0V?=
 =?us-ascii?Q?Ku6UNXkhHungNcCy/LJ8g67ymDVf9PeNBA+gP1CzDzPkWdZR7YUHDsbZWVU3?=
 =?us-ascii?Q?h3X6zgUbKTLTwmcaHQhwAo9NlpuhMNRHuLlyzCH/YN8rpna9dXNUwWJjtQ8f?=
 =?us-ascii?Q?toNmUgLO2iDc+MKbOVLDlO7MM8oqepMTSaEcLn2IA8FC9In12B1PuseTypXl?=
 =?us-ascii?Q?wMkxWL8t6zlE2b8XrQpf/HycSa+cE/1OHEtxpMCe2eu9/nimxxt2Np8iGFNI?=
 =?us-ascii?Q?7A/qQ2xhcO4AVZvA1sDN2fRSk+KQdMBvPSsC4PdJVLAS70XKoEPf4/dy8BAI?=
 =?us-ascii?Q?haxNmfOhbhuAJW6NulUecP0rNN2E1a3yvh52B0JX/k+PvQakgJgAMNA7UooZ?=
 =?us-ascii?Q?NG1Vh02BKQGM5GpEH/aS/I1HgyoGNdefOiy9GJYukU+vcPmqYcKodghqcq48?=
 =?us-ascii?Q?9fqG2DOiOU9+mgHM5uzu96FR6jCZmovNTBBbbXCSGDZr0FnUkspKYVhrouPT?=
 =?us-ascii?Q?VLfekwmtnR40/NblhIBHxl45etitVsm+m6J7r+rKZCENzwsFz++HX0IHUF3t?=
 =?us-ascii?Q?TbVP6MHM3SnesMOW0bU0tpbgw6mCTCapx0pqCON0zLSFLe6E4OLc5QuLjY7o?=
 =?us-ascii?Q?8POMLYZsxz9fcFFqSvlUCFVA3xWUhb/2M6YlxBg2cQ00k8dt4ZwmUh/+GxEv?=
 =?us-ascii?Q?7DKr4GKqW4UEs/uhHNQwuLuHPxmM9ihHLjx6uCg5FWtxu0TcIO3qSB2TUhBr?=
 =?us-ascii?Q?GpXTqGrUVocTZ+xiqhvFLetSztx12w0o+4JClxMN+1c9D/IgedORAEFNTkaO?=
 =?us-ascii?Q?joHw60Y9xV7EspMqzCFNu+jtFA8k9W4/x293B6S/CWZQsWKAm29A3etiT6Dw?=
 =?us-ascii?Q?Sn2YkQOdM4RZb+JOno/9EiRyQXislZI065DryEWbE48YhEsG8bPBTQRN2MQ1?=
 =?us-ascii?Q?jBVEXV/I55umN1BYOnA7FCipcPYi+0Yh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ysgEpHgC4Htp5W960+gr6nZH+1L8lCD+ZX++sOZFnDo3im78lOIcN6xIqmP?=
 =?us-ascii?Q?o7Kx35iYd7qItZ4E3IffZHQlgO1njqfm7NJVvmrlfIy0j7GHsLtHuQmZ/lbR?=
 =?us-ascii?Q?bZfcIqfMUTFr5PHm9oqzFJGwbpo59FKyAn+uaI7ooJz1lBePsAb4P0CUv6sD?=
 =?us-ascii?Q?qIZn5Xln9aRUpUbNLJDv+VmM8oe7+ZEDFMWCskLD60G01YRGmPnI+eYvUJ7e?=
 =?us-ascii?Q?dLmokM5IUJZUd8DPj3/lMyYBKcjdHTBP/9fsaa5GLZQL/32ABp63ZtxNDks5?=
 =?us-ascii?Q?GKmRPzBJP+IlZLQUOjxR+VJBDpcBx9hImliRFpt0MXKwGjwzLq8g2O+gXsF4?=
 =?us-ascii?Q?hxQiD6IVt/0TH3Qnq1nCPVgiFsyyfHzF4AsIBEv6eyzTvmqzktF7i2XFYUgl?=
 =?us-ascii?Q?4pujSl4yAepfqRIKkvIKV/hy8s4TapnWo2NkJF0t3YmtxSrXfjwZkCjzNqvz?=
 =?us-ascii?Q?+G2I3nMrxlscQ+elYJLEEO+PVmUvh5NWor1UR2U8gYabGIY3HAbn+UWQ/9O3?=
 =?us-ascii?Q?wVcLurOvOWgjamVgFrxa7hUXbhU3mwhC46Z1at21knw45TO6cyC+S3n6/Fms?=
 =?us-ascii?Q?Mp7rD43lWTXIRH0O84Aguqr/UJ3UGzFmFBDBeukOCnoDpTdjzlKzmMED4mKB?=
 =?us-ascii?Q?8v6PMPC0lreDX95UOoK0dUtxRlnrPNsp10NMZ5lKlm8xE+TVhXQFbMukoqTS?=
 =?us-ascii?Q?1hZTsmvRjoSZGKQo00D2p5TWXca8LZsFi0DYqab98CiUyQynyPo7SIdsnBKh?=
 =?us-ascii?Q?ch4seMe1N+BpMoHu4joRYI1HV0rWAKYAI+DArffFK+YNDNom3UcRaOJ9hstm?=
 =?us-ascii?Q?O8/YcWEIi4kgVDgFzJuMMh2GUObelbqX+5sw4+jE1a91wpOK80Qtg/0Y1Z5R?=
 =?us-ascii?Q?nHXpbQbc3s6jfLyJaWC2WO61zy37fQgv5MEhQ2VvaPbuQXdFhU9UAxS3w5hb?=
 =?us-ascii?Q?tK+Qr+pGQuPJ2AtoZ4fvHEFQ/kUIqZqv3zTT8Oo6pLFHhhjluXGA4YmQ2hf4?=
 =?us-ascii?Q?8bfpB7NrVypft/kVqGwjNuLE+V6gyJcGCEREGvQrns97zJLGbS9orBTF/rby?=
 =?us-ascii?Q?5O/6QXttJbv7Ol0PQY/tNbcUyuAy54SitzjIpXGR8H5Q9nt0aRpTs7iqSOE1?=
 =?us-ascii?Q?L3ZXmEoEjAjGe6tMVAtXNzlXtvMva6J/boBf6iXqDjiMyn7RM/R4hB2tRV27?=
 =?us-ascii?Q?JJBMKZxOltCMRl4smnT+ma6zGb8BNXJemhPLRoX9lbfA5m5cre3jUJuQYsZu?=
 =?us-ascii?Q?+OHMVF9GOaIaGkoLS4W6xeLxgCgVy01f8hKu97hSgKi+tdvOpA5EB4pQ52Lw?=
 =?us-ascii?Q?jHaW+Hwa0CV8n+DIC9L2ztRojObD0v7ijZo5pIl6lboSffA8fyet9fKY3PsE?=
 =?us-ascii?Q?0gRkOgpRa9IMnXVoyETdoCIGPoZPBD4Tm5fmzSrtN7UQbQEsZ2BwDpgVofBm?=
 =?us-ascii?Q?GHxS24GlLeAyVoJqQFkeTo/dgOD1aMQ3Zxah4TkWAYYf/ZE0mI0wzh27SA6/?=
 =?us-ascii?Q?hjfzcmarTyMp8xByAXtxGndNZtRQA5MOZS/L43OUnszSMtDnnCfjWX9gJc5U?=
 =?us-ascii?Q?ZBXrFOS6jeO0JB7lK78tkGJD4fEJVhwaNWRcOtCg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3162da-c893-4008-bc72-08de2c89efeb
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:20:08.2906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeeOF1TlSoXtUXuKvDKubvmmp/bOB2A4So4waQHfT6Dij9yxTujWqw6j8UpAnzUx60GEmQvl5dLIUT2/Fjn2pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6755
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 26, 2025 at 10:52:51AM +1030, Andrew Jeffery wrote:
> Hi Marc,
Hi Andrew
> On Fri, 2025-11-21 at 16:02 -0800, Marc Olberding wrote:
> > Add a board file and dts for msx4. the board file is required
> > as the BMC is strapped for ABR boot support, and this functionality
> > isn't desired as support in linux is lacking.
> > 
> 
> Can you expand on this? What's missing?

As far as I could tell, support to pet and eventually disable the FMC_WDT2
doesn't exist in the linux kernel (I'm happy to be wrong, I'm not in love with this workaround)

So when the 2600 is strapped for dual SPI ABR, we just end up boot looping
between the two spi flashes, since no one pets the wdt.

This patch just disables this support altogether.

> >  In order to enable
> > BMC boot reliably, a board file that disables the FMC_WDT2 is
> > included.
> 
> Hmm. Can we do this without requiring a board file?

I didn't see a great way short of writing a driver for the watchdog,
which wouldn't be a bad idea, but we'd then have to go write up linux support for it.
I think those are both worthy goals, but the support today is nonexistent, and
this at least prevents people from bricking their BMCs.

We could put it into the u-boot env through calls to mw, but that seems worse,
its pretty easy to corrupt the u-boot env, and in that case we'll end up with
a brick.

Let me know if you have any better ideas.

Thanks,
Marc

