Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD1043D0C4
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 20:30:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfch72WqMz305T
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 05:30:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=ioBayY5G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.mihm@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=ioBayY5G; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hfcgb6lFvz2yPW
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 05:30:10 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230183999"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="230183999"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 11:29:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="447644935"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga003.jf.intel.com with ESMTP; 27 Oct 2021 11:29:07 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 27 Oct 2021 11:29:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 27 Oct 2021 11:29:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 27 Oct 2021 11:29:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 27 Oct 2021 11:29:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld+Gu3NGgIsyl9l5k/X1P5ZCV5LfHi7zDYNRmlvEcz4rgMJp9CTtbBeBRj+RsEID1I2Om3XWR9VtVDY1gKEKXEpk5OMalxUS2jIcMaSLiMKwpMV2HKWNhwqKwdE+F1Drhv4Sn9d9OK08eD4ZjuQvbp5BL7ZYtBFe8QtiQA8H9JCVqRKcya2ANlTJDwREy+saePigJQXzb25QKkOFqvldtTl7Hv8at5Mky0XOXPWVsJ7XDTLgG4rDQz6fslB7b5mf/YRXPlkIYc1F6V+jxcP5+Rw4khxfGJJvyyx+MTq8rPHmdR2EHeDOdmzbqP+FMHA1B7B6cGzjIjyDSim2TyvR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHJNMa0onobugoyr2ge52W9lYZXP623yiiBn0VKwZII=;
 b=jahPaqqmWsWzP+RCPUXIUc/Y2zTsv/9ESVHGvXcStnLzUeRpdp+vY6TBp4GePRHwiEu75DSOQxxa5Xcsr/d7E8XgtZTV33dl/wXCzCPUpjW4gWahryY+C5GC/bdNcNZJbUpKpfljfi2fx138nKHx48EK4f84cqYOgF9WOxqiWzasDh6+Q5yly8i/0y4ji1UpVm2m9EdAgj8j+p6HKmTLkQPi4oet2zX6cV3gYrR4f01vNznoHHWhjuU2wkf/OktQBvjhZl66+k2vYkt5OYO2j1uRAVkYFQ46dkM+w208It79lJVb91mi6018hOp8Lz7R7SgfcpSkDey6fRyNHmPR5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHJNMa0onobugoyr2ge52W9lYZXP623yiiBn0VKwZII=;
 b=ioBayY5Gmvu5YLLQWWAZcZhWPGr/Ax5uxBIx+iN9MdNvST9Jv41CmOYqYiOa6kgCwrKmWIzMoe/pbtsQHi7kqJOSxqzd2uGDntf/r3sDKsu0GgJ1fE/NaDK0J0WbM7XQmN5yao5MD2T8PveNgwuYYIw4ncyDcLt94EPXEB3Qxk8=
Received: from DM8PR11MB5638.namprd11.prod.outlook.com (2603:10b6:8:27::13) by
 DM4PR11MB5565.namprd11.prod.outlook.com (2603:10b6:5:39a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.20; Wed, 27 Oct 2021 18:29:05 +0000
Received: from DM8PR11MB5638.namprd11.prod.outlook.com
 ([fe80::7cd6:eee9:5828:d31a]) by DM8PR11MB5638.namprd11.prod.outlook.com
 ([fe80::7cd6:eee9:5828:d31a%3]) with mapi id 15.20.4649.015; Wed, 27 Oct 2021
 18:29:05 +0000
From: "Mihm, James" <james.mihm@intel.com>
To: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>, Andrew Geissler <geissonator@gmail.com>
Subject: RE: Start using github security advisories
Thread-Topic: Start using github security advisories
Thread-Index: AQHXwHV8/QSmVmWd9ke0EhO+KGwPHqvS3ecAgAZDEwCAAAR7AIAOFgaA
Date: Wed, 27 Oct 2021 18:29:05 +0000
Message-ID: <DM8PR11MB56387B6B7713360A95C7959090859@DM8PR11MB5638.namprd11.prod.outlook.com>
References: <62b15edd-110a-3574-66c5-d11299bbd38c@linux.ibm.com>
 <67C8A5BA-9FD5-4804-B5CA-C2687FC17889@gmail.com>
 <20211018184958.zajwqmloxsyxmxv2@cheese>
 <cd2f6175-475f-0e5a-0b65-4f7a12959ab6@linux.vnet.ibm.com>
In-Reply-To: <cd2f6175-475f-0e5a-0b65-4f7a12959ab6@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: request-justification,no-action
dlp-version: 11.6.200.16
authentication-results: linux.vnet.ibm.com; dkim=none (message not signed)
 header.d=none;linux.vnet.ibm.com; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d41ce54a-6924-46fe-b015-08d99977a82c
x-ms-traffictypediagnostic: DM4PR11MB5565:
x-microsoft-antispam-prvs: <DM4PR11MB5565F0EB72D7C994504FC32F90859@DM4PR11MB5565.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AHnsq3WZLtrZd3ni9zQiD7CLEq0Zq737pn7ySlSBv9NtMFoVWpHt69PmlaTCkRPR4tBWvofttdfhVfMvSee43Eba5+kiHHDYJxYGNGZctxjrzEyjD+PVO6kQdY/Bxq7vSS9S9A9VKQAN1RQm2qR2oQT+JAQ5OZtzV9cyPY6koOqYhayWQKlhEsg4qttMjr15/EZf0Munue9+/5rrbfc3q6RqNlhv28G3ZwoPx9ujCmwUXKten/S7kFWJbhhy70D+1jT4RMI9MqxdfnvLAl/iTICcFRourAcjqDZCGuAW54qvzsfzlegCUzXuHV0dNfTcQu7lG2/z+dhwnYHIwt5OADe0XBWom0247j0JyvLqquTlEGSzEC/0X1CzxNQE602ZkFLHY9IikNk6m00facY8qk9c1PS+a9SGRyVXbiTgA5NFZXVe8iB/UV2l0Ec9DnDX1L6DIVKviIEbavIU5zbtE2Ey26NgyIXCh+B1/NH8JACWsd8LtyqFBuGWAXGQWgLtOspHbFpPiAsqgPMVFdfXblEBL3rLBy7SDEOOR+9wh2QzDuG23IaV6uNSPwyD+ny0GcMb4Vyd+SflmtlAG99UEYVJ0+hTrq7UNILITLGD4dHN9Nw9/FOWQtNeB7OuzzhkKozUIFyeaIR27l6IZTil5TV5KK5Gjjh/wr/7g/wVOcsrEW0gXSoNW44bftHOCyqZ8Ziyg4rW2XAnJnwWEPs82acjyEqPUrukyAQlYY9TusA7e1ewICtNjQr8TgrSZvOB6wl4F3U8/SQU/rdGBOptxAzPlSGxKGnOPfXJbasug1s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5638.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66476007)(26005)(64756008)(15650500001)(66556008)(186003)(6506007)(122000001)(316002)(9686003)(71200400001)(52536014)(38100700002)(76116006)(55016002)(66446008)(54906003)(8676002)(508600001)(2906002)(8936002)(38070700005)(82960400001)(86362001)(83380400001)(7696005)(4326008)(33656002)(110136005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWlkejlER0NrRWZjZDMyR1h5bk5zOExUb214NnZGaVgwT2hPQU90NThZMWJJ?=
 =?utf-8?B?K2FSWTFwVDlseld6eXkrWi9LU1VpODBNT1JmbXZxY0pzN2QvaGdKTkFtQ2JY?=
 =?utf-8?B?ZlM1TWxra2hrNFZCYU1yb2o3N0lab3dKck5ISEMzREVNcG9pdEhHT3lNSDJ5?=
 =?utf-8?B?aTVjY0pzSnZlUkNIM3Q1MVM2RCswTXVvMDlVT3BBTlhwMm92S1NScUYveE5P?=
 =?utf-8?B?Qmo4Nkl0MEg1dm5JZmFCMzRJSklSb25laHRFYnE3bENPUmFCdVQzYnAyQnVS?=
 =?utf-8?B?U2gyREZhbFdPS0ZGeHZ2aVcrZ2ZNN2tCNlY1cHFyM2hpc3lPdkcyWE1ib3BU?=
 =?utf-8?B?dUVjMGdhU01BRHMwZW80bG5mVXU1MzJhSE4yWHE4NXdURGhjOVhEQ3JaQjB0?=
 =?utf-8?B?K084NXJQZ1k0NzNrVEpjZXRUYm1kYzUvM1lmQ3luZ0wzY3VkUWFITGdXVTkw?=
 =?utf-8?B?dUd2SVFiRnQ4a3VyR3llRml1WFl2WExJTWZyaGZKQnhEVU1nK2p3cUsrOEpj?=
 =?utf-8?B?MXRMVXlqRVB2cWlFdExXWVgvdVJnN1FQVXJ6ZmJlcE96dkJKaFMvODlEYUwx?=
 =?utf-8?B?QXZkNUJEeXp3T0FBaTVyVlc1UGhaV0w4MThzdyt2N0svc2xWVUptclZXaFl6?=
 =?utf-8?B?aWp0cHdPd2JxMzRVUVJ2akFHZmNvK0hGUWVDbGppREwyMUNhUXJ2Mmw1NUg0?=
 =?utf-8?B?SHZsVlgxdnNHZnFIUWFnR0ZBUHBwcWdpaEcxODlXMzNQSmZVMENQK2oxTHdy?=
 =?utf-8?B?ZWtUZGhVM0lCeGRRUmVkeUtoTE5ueFYzcDRCeUFOd3h1ODcwQTl4Z2VocXJv?=
 =?utf-8?B?Q2JTWmlMNjllWE1jdXFNbHhMWi9zS1Z3MVU4NnRya1VqaWsyTEM4bDJPbXh1?=
 =?utf-8?B?UmF5SVlkREo3eEZtc09YWEpoSnlyTUppbVdtOGFrZW1xSFE3dmJPSjlNdlZH?=
 =?utf-8?B?ZW5Ea0U4aFNFZThSODQvcnVTbGc4UHE4SlhtQkI3UHNBc1pHRnQzV2RvYnV5?=
 =?utf-8?B?Z2hNckRpV0g0WHpLSGt2aUZWZklZdENwb0ovSU5vc1ZXT3VtbzVlUDlSWnNl?=
 =?utf-8?B?Snk4U3VaRkNWMitXOGhFWThORVdNb0J4RWNwMW9uL29DYjdJdlYxTFFFRWFn?=
 =?utf-8?B?RG1CV3d2Ni9IZXpPREVsK2dxMlp2NXFBWDhtSFQ5VjBmUTJQTFVtem1BQ1g5?=
 =?utf-8?B?aDY1dldFUDBnYXE2eTBpQ3dtbUROc1hlNThQNVp1M1JOZ0hvb0dzTGdOQmpK?=
 =?utf-8?B?RFB3c1BTejdyQnJKMVhJVlpwcmNlckhrejNPZU5KbGNNUURMOWltaENSVnVV?=
 =?utf-8?B?Y012ZzM0VHJFYUZqTkVTUXRta1JHMTl6Vlc4aFRFRm1kdThaSlN0SUVacDlC?=
 =?utf-8?B?Wk4vakVodE9NRTdLRnFxY2s3RVpsQ0FLMkNscGVxSG1FSzZHRXA4ZUpTSGkx?=
 =?utf-8?B?Tk1sOHpiUFE4NlhpMm52akxmdGZycXd3NFN1SkpuR21MZGxNbkprRE9Pdm5N?=
 =?utf-8?B?cUN4eis4U3dZVlFGTXQ0YmJIdjRjZXV4RjQzalFlTDBqUVZmZ2Zsc1BTdVdP?=
 =?utf-8?B?NWJTRFJIaTVoaDd6MXlpY3V2L2NNMXorK1gyTHFiMkpQT1FNLzY4S0M3TWxq?=
 =?utf-8?B?cW9YbWxsaWFORm1zem4zSlBub3FhYSs1eFVldUdPMEYwUzVpdVYrWnB2QnFT?=
 =?utf-8?B?VlJnOHM4V0JKdGhrcllkTVd0V3Ayd0dQRGdOZUlNSFlidjM5VmZiaVVZTXNN?=
 =?utf-8?B?RGdCSlh3RVNYVWMrWGVsU3FnTnBGUDBidGNBYzdDaUpPWmtoclJxKzQzV1l1?=
 =?utf-8?B?dWtmV2FtMms1Y3NkbmNNNXc5ZUZEbGlLM25wRzJHM2s3R0lLQlplWnVNVTJ0?=
 =?utf-8?B?YTBrSjZJQjZFSVo2Qk5uRkVGUmdxMjlXUmlPejJzRDVoOGlCdGthRWZBYnZl?=
 =?utf-8?B?Y1hNK0VmZmJSQjFKVzVvQThxa2F0dno4bTlqVkdjQWtNOXFEejRrNXp1K0VM?=
 =?utf-8?B?OVhjNE1DRi9vb3pOcjRsbnJJSmhpNkM5UDBBWUpJbnhVQkN2TGtxS1hoZ2J6?=
 =?utf-8?B?Z09meisxWnMvSmpSb3c4MGVhZmlvKzhoTm4xMEdJRTZrc0haODNVMnZ3ckNG?=
 =?utf-8?B?UHB5UXVCQ1c2MXNHT2J4YVpzbmJ2S3dNM2diNmk2QWxRbjJlb2lQcG5UREtp?=
 =?utf-8?B?WEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5638.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d41ce54a-6924-46fe-b015-08d99977a82c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 18:29:05.0299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p0y4nQVtZicrWUqdbHXipDXc3tPcK0eCbwIBUteH2LdypQig48bphmG2CCROb3p0aldOdErrphfZEsQcQcL43w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5565
X-OriginatorOrg: intel.com
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

QnJhZCBvciBBbmRyZXcsIENhbiB3ZSBwcm9jZWVkIHdpdGggdGhlIGNyZWF0aW9uIG9mIHNlY3Vy
aXR5IHJlcG9zaXRvcnkgc28gdGhhdCB3ZSBjYW4gcnVuIGEgY291cGxlIG9mIHRyaWFscyBvbiBz
ZWN1cml0eSBpc3N1ZXM/DQoNCkkgdGhpbmsgaXQncyBpbXBvcnRhbnQgdGhhdCB3ZSBhcmUgYWJs
ZSB0byBtZWV0IHRoZSBmb2xsb3dpbmcgY3JpdGVyaWEgdXNpbmcgYSBnaXRodWIgcmVwbyB3aXRo
IHJlc3RyaWN0ZWQgYWNjZXNzLiANCg0KYSkgaW5kaXZpZHVhbCBzZWN1cml0eSBpc3N1ZXMgY2Fu
IGJlIHJlc3RyaWN0ZWQgdXNpbmcgYWNjZXNzIGNvbnRyb2wgbGlzdHMgd2l0aG91dCBncmFudGlu
ZyBnbG9iYWwgYWNjZXNzIHRvIGFsbCBzZWN1cml0eSBpc3N1ZXMuDQpiKSBpbmRpdmlkdWFsIHNl
Y3VyaXR5IGlzc3VlcyBjYW4gYmUgbGlua2VkIHRvIHByaXZhdGUgY29kZSByZXZpZXdzIGFuZCBk
aXNjdXNzaW9ucyB3aXRob3V0IGxlYWtpbmcgaW5mb3JtYXRpb24gYmV5b25kIHRob3NlIHdpdGgg
YSBuZWVkIHRvIGtub3cuDQoNClJlZ2FyZHMsIEphbWVzLg0KDQo+LS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj5Gcm9tOiBvcGVuYm1jIDxvcGVuYm1jLQ0KPmJvdW5jZXMramFtZXMubWlobT1p
bnRlbC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIEJydWNlDQo+TWl0Y2hlbGwN
Cj5TZW50OiBNb25kYXksIE9jdG9iZXIgMTgsIDIwMjEgMTI6MDYgUE0NCj5UbzogQnJhZCBCaXNo
b3AgPGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT47IEFuZHJldyBHZWlzc2xlcg0KPjxnZWlz
c29uYXRvckBnbWFpbC5jb20+DQo+Q2M6IG9wZW5ibWMgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9y
Zz47IEpvc2VwaCBSZXlub2xkcw0KPjxqcmV5QGxpbnV4LmlibS5jb20+DQo+U3ViamVjdDogUmU6
IFN0YXJ0IHVzaW5nIGdpdGh1YiBzZWN1cml0eSBhZHZpc29yaWVzDQo+DQo+T24gMTAvMTgvMjAy
MSAxMTo0OSwgQnJhZCBCaXNob3Agd3JvdGU6DQo+PiBPbiBUaHUsIE9jdCAxNCwgMjAyMSBhdCAw
MjoxMjoyMFBNIC0wNTAwLCBBbmRyZXcgR2Vpc3NsZXIgd3JvdGU6DQo+Pj4+IFBlciB0b2RheSdz
IFNlY3VyaXR5IHdvcmtpbmcgZ3JvdXAgbWVldGluZywgd2Ugd2FudCB0byBzdGFydCB1c2luZw0K
Pj4+PiBbR2l0SHViIHNlY3VyaXR5IGFkdmlzb3JpZXNdW10uwqAgSSB0aGluayB3ZSBuZWVkIHNv
bWVvbmUgd2l0aCBhZG1pbg0KPj4+PiBwZXJtaXNzaW9ucyB0byBnaXRodWIuY29tL29wZW5ibWMv
b3BlbmJtYyB0byBjcmVhdGUgbmV3IGFkdmlzb3JpZXMuDQo+Pj4+IFRoZW4gd2UnbGwgd2FudCBh
IGdyb3VwICh0ZWFtPyBwZXJoYXBzIHNlY3VyaXR5LXJlc3BvbnNlLXRlYW0pIHdpdGgNCj4+Pj4g
dGhlIGN1cnJlbnQgT3BlbkJNQyBbc2VjdXJpdHkgcmVzcG9uc2UgdGVhbV1bXSBtZW1iZXJzLsKg
IChJIGhhdmUgdGhhdA0KPj4+PiBsaXN0LikNCj4+Pg0KPj4+IExvb2tzIGxpa2UgeW914oCZbGwg
bmVlZCBhZG1pbiBhdXRob3JpdHkgb24gb3BlbmJtYy9vcGVuYm1jIGluIG9yZGVyIHRvDQo+Pj4g
dXRpbGl6ZSB0aGUgc2VjdXJpdHkgYWR2aXNvcmllcyBmZWF0dXJlLiBJIHdvbmRlciBpZiBpdOKA
mXMgYmV0dGVyIHRvDQo+Pj4gY3JlYXRlIGEgb3BlbmJtYy9zZWN1cml0eSByZXBvIGFuZCB3ZSBj
YW4gZ2l2ZSB5b3UgYW5kIHRoZSBzZWN1cml0eQ0KPj4+IHRlYW0gYWRtaW4gb2YgdGhhdCByZXBv
IGZvciB0aGlzIHdvcms/IFRoaXMgd291bGQgYWxzbyBwcm92aWRlIGENCj4+PiBwb3RlbnRpYWwg
bG9jYXRpb24gdG8gdHJhY2sgZ2l0aHViIGlzc3VlcyBmb3IgdGhlIHNlY3VyaXR5IHRlYW0uDQo+
Pg0KPj4gVGhpcyB3YXMgbXkgdGhpbmtpbmcgYXMgd2VsbCBBbmRyZXcuwqAgSSdsbCBjcmVhdGUN
Cj4+IG9wZW5ibWMvc2VjdXJpdHktcmVzcG9uc2UgaWYgSSBkb24ndCBzZWUgYW55IGNvbXBsYWlu
dHMgaW4gdGhlIG5leHQNCj4+IGxpdHRsZSB3aGlsZS4NCj4+DQo+PiAtYnJhZA0KPg0KPkkgYmVs
aWV2ZSB3ZSB3YW50IHRvIG1ha2Ugc3VyZSB0aGF0IG5vbmUgb2Ygc2VjdXJpdHkgYWR2aXNvcmll
cw0KPmdldCBzZW50IHRvIERpc2NvcmQsIHdvdWxkbid0IHdhbnQgdG8gYWNjaWRlbnRhbGx5IGJl
IGdvaW5nIHRvDQo+c29tZXRoaW5nIGxpa2UgI2doLWlzc3Vlcy4NCg0K
