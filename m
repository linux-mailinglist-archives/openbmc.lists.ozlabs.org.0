Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A764E622520
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 09:13:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6d5R4GKPz3cJn
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 19:13:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=YZzVIk9B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com (client-ip=122.184.60.32; helo=inchng03.tcs.com; envelope-from=prvs=305b75172=sandeep.pkumar@tcs.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=YZzVIk9B;
	dkim-atps=neutral
X-Greylist: delayed 68 seconds by postgrey-1.36 at boromir; Wed, 09 Nov 2022 19:12:58 AEDT
Received: from inchng03.tcs.com (inchng03.tcs.com [122.184.60.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6d4p2lQxz2y84
	for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2022 19:12:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
  t=1667981577; x=1699517577;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version:content-transfer-encoding;
  bh=G/Nfeoek3986xGsRsnVrr9f3Rqw58AIm2u8RBkuiIyY=;
  b=YZzVIk9Bm9srO/YYuWUHZ+t0h3BhjHJBBjBaNfl3bGqYjtiFdMaLCQhK
   S9Px2WiuPzph5O2eG+VGVf+cZECut03MC82H6VXF0SsSvSJ5rGZWVLGvA
   qhOCAyrD065V6qOqhAOjKv9HDwJeG/AeF7NeRkb6L+gJeIJNm3J/sFNYi
   PUgMRqYkX0LbSEG5P5f6bYl4zeQ2mBmKHcDtR9rrbMxyJedDHix/HXfvK
   FyIf0PCL+d+nemHP0Kky7kSN0Z4ufp/06uiBfp6YdRMaK1nvZDOqxPMPf
   PY558fOMU4H0qvewjYo8EuMS+odWv4BMZ/JVFnohjCleIsgyCUo3hSrej
   w==;
X-IPAS-Result: =?us-ascii?q?A2DvAwCfX2tj/0cmqQpaHgEBCxIMQAmDc4EAgVqVaAOdQ?=
 =?us-ascii?q?IFqDwEBAQEBAQEBAQcBAS4WBAEBhQUChHomOBMBAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?wEBBgEBAQEBAQYEAYEbhS9GgjUpAYNjAQEBAQMBOT8MBAIBCA0BAwQBAQEeE?=
 =?us-ascii?q?CgKHQgBAQQOBQiGF6seAQEBdoE0gQGCFASdPoFngUCMRYRHglCBWIJnPoFTg?=
 =?us-ascii?q?Q8EgSkBEgEjhA6CLgSXNzgDRB1AAwsbIAYsDUsbWA4JHxwOFw0FBhIDIG4FQ?=
 =?us-ascii?q?Q8oL2crHBsHgQwqKBUDBAQDAgYTAyICDSkxFAQpEw0rJ28JAgMiZQUDAwQoL?=
 =?us-ascii?q?AMJIAQcBxYRJDwHVzsEAwIQIjoGAwkDAiJXgSQmBQMNFyUIBU0ECDkFBlISA?=
 =?us-ascii?q?goRAxIPBiZHDkoaJDkWBidEATMODhQDXoFtBDVJmn2BexkUgRUHHCqTJLAnB?=
 =?us-ascii?q?4NqgU2XDIgXFqkVlzKiQoUNAgQCBAUCDgiBeYEOcDMaI1CCZ1KBAJwYdQIBO?=
 =?us-ascii?q?AIHCwEBAwmKZQEB?=
IronPort-PHdr: A9a23:TjTreB251JH1syCDsmDOrwMyDhhOgF0UFjAc5pdvsb9SaKPrp82kY
 BaDo640xwaQAs2bs6sC17CN9fi4GCQp2tWoiDg6aptCVhsI2409vjcLJ4q7M3D9N+PgdCcgH
 c5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTajbr5+N
 hu7oRjeusULnIdvKLs6xh/VrndVYehbyn1kKFyJkxrg+su8+YNo/jhNtf4m68NOS7jxcb4iT
 bxfAjQmMmQ169PuuBLeUwaB5WYSX3sPnBZQDAfL8B/1XpHqsivnreV9wzWVPdf3Tb8vRzuv6
 bpgRQLyhycGMz4593zXitB1galGrh+tuwBzzojJa4yOKvFwYr3Scs8bRWpZX8ZeSSpBAp+nb
 4ASC+YNJPtUo5Xhq1cLqxa1GAuiC/71yjJQhnH4w7M33fk9EQ/I3wIgEdABv2jbotr6L6oST
 fm1wLXUwTnfc/9axzHw45XIfBA7pvGMWKp9f9fLxkkpCgzKkEufqZT4ND2Qy+QNtnKU7/B9X
 u+okG4osQdxrSWxycgykonFnJoVylPZ9SV82ok1P8a1SFJnbt6/CpdfqyaaN45vT84kXmpnt
 zo0xKcctp6nYCgF1o4nxxjHZvCafIWF/hLtWuieLzp4gH9oebayiRm8/0WjxeDxSMi53VVOo
 ydYkdTCtn8A2RLR58aIRfVz8Eis1SqP2Q3N9+xJJ10/m6nDK5M537I8ioAfvVnCEyLygkn7g
 qybel8m9+S18+jrfLTrqoOSOoJxlw3yLqAjl826DOsiLgQCQm2W9fmg2LDm+ED0QrNHheAsn
 KbDqpDVP8Ebq7a8Aw9Sz4ks9Q6yDyyj0NQEhXkHK09FeA6fg4jpJV7OJPf4AO+8jVq0jjplx
 ejIMLPnDJvXKXbNjqvscapj50JEyQozy85Q545MB70cPP7/QFL9ud3cAxMjPQG5wPzrBddg2
 o8GXGKAGK6ZMKfcsV+S4eIvJvGBZJQPtzb7Nvcq+eDhjWcjlV8FfqmpwJ4XZ2qiHvl9P0WWf
 WHsjs0dHmcNuwoyVOrqh0aaXj5Je3myR7485i08CI++E4vPXpqtj6CZ3CenAp1WYXhLC1GCE
 Hj2doWEQOwMZTmMLc94jzwEVL6hS44u1B20qAD6zL9nIvLO+iIErZLjyMR15+rLmBE17Tx7E
 cKd3HqIT25ohW4IQz423LtjoUxm0FuD1ql5g/hCGtNI/PNFSAA6NYTTz78yN9enaA/fNuiES
 U29CoG0HjwwVckZzsYTYkB8C5OpiRWVjASwBLpArLWNCJE56ur/wn34PY4p0H/A2KQslx8+Q
 dZKPHeOmqVksQPUAtiawA2ii6+2ePFEj2b2/2CZwD/L5RkAOOY4eanGXHVKYEzQoJy5407ZV
 LahBPwhNRcJ0s+NLKZGK7iLxVVLTfvuIpLSNmS2nWrjCROB3LjZao3sdi0U1zncD05RlQcV8
 D6GOAEyCz3nrXjZCWlyHkmpaETpooFD
IronPort-Data: A9a23:1Y2+16iVLIyFRndFKv/kAO+WX161zhIKZh0ujC45NGQN5FlHY01je
 htvCD3Ua62IMTf3c49+btmw/BkF7ZDVn983SgVvrSs8RSgW98bPDovCJUurYn7JfpSZQR46v
 ppAY4nMIphvHySD+T6gY+PrxZVeOQFkZVZe5MrsYH0ZqdpMEX954f5bs7dlxNYu27BVOivV0
 T/Ii5S31GSNhnglbAr414rZ8Ek15a2q6GtD1rADTakjUGH2xiF94K03ePnZw0vQGuG4ycbjG
 o4vZJnglo/o109F5uGNy94XQWVWKlLmBjViv1INM0SUbrqukQRpukozHKJ0hU66EFxllfgpo
 DlGncTYpQvEosQglcxFOyS0HR2SMoVF6aDpKEa5j/aVlWLnLV31/tJWVXM5aNhwFuZfWQmi9
 NQ5DhstSDynv8eK6erhIgVurp17apC1bcVE6jc/lFk1Dt5/KXzHa77D49NV0S92nsNTGP/ET
 9YScnxkaxGojxhnag5PWM1nxLz27pX5WwxZ9XS8lJY52UzKxS4y9/+9a97vYOXfEK25mW7d/
 Aoq5V/REA4XNceE4Tec73Oqh/+JliT+MKoVDLC+/PthqFmS3XAIThoEUVKxur++kEHWZj5EA
 xVMvHNw/O5ppAr0F7ERQiGFnZJNhTZEM/I4LgHwwF3lJnb8i+pBOlU5cw==
IronPort-HdrOrdr: A9a23:eEbyLqzBrN+f0u4/BIUwKrPx3uskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcdDpAtjlfZq6z+8K3WBxB8bEYOCCggeVxe5ZjbcKrweQeBEWldQtrp
 uIEZIOcOEYZGIS5aia3ODRKadY/DDtytHLuQ6x9QYJcehCUdAX0+8vYTzrdHGeCTM2cKbQU/
 Gnl7V6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr2AjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKsm/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdf11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtBqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bWnHAbgcYa
 VT5fznlblrmQvwVQGWgoAv+q3lYp0LJGbKfqBY0fblkgS/nxhCvjolLYIk7zc9HakGOuV5Dt
 T/Q95VfY51P7IrhIJGdZQ8qJiMex7wqFT3QSuvHWg=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,149,1665426600"; 
   d="scan'208";a="810871036"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XW6aK4vDXvs6oN7ZF81+g2D8ZXr7i4GI1yO3Pa2f/CS7aQpLVmViG0f5FIInJMWG55hINr1iEFcB3enPitJe+xKWAPqqpWzQ+8Na1hRltho3YG4m5F0jAQ6oguEYSJT5KDHG9UjH40Ce3su9Nm1rO6Pj2ekDap3k6abmm/Fgn4xW7aOxis3q9xywmYzmUtADODFm/Abb+3YKE32UBYAfxQUS6GKNxPGqcGiYZ+2gvI6+GRRdjXU8pV3BbGqhNc+y3rjNWCULnzOXQpgug7XGDPd0GAEtnN7mDUD28AdAL5Ib7/QFohxWgIbtXFFb0bzPZOWAzMtj+4AWvArM3F++Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/QDmR2ZMK2/RIueaQ3y/C4Ah0lk3SgeLoS+s2r8q9s=;
 b=TgXRfvKEGlyc8w5F09UscAUPzhlu45TZzBdXkXsqSgaoDGWSTzbA5uR4Uy13pn44zNGDiWsBmn3vXWMnhEtbrXqEWUziPPNAdWkepcaHPzxGD/Bxk3zluMLO9XTGxtUkJVz1Dy20n7mmiif/T9LSvONyXf2d1d6WNaP7+4AQvWzOstWjfvhGUyb1JF7cgBh10jrvGXk9kNEASr/NWIRqioyVqlWquzf2PBlFgJngeyiE4cJJuABtOXypS3pUcyBVDXHZtPk1kU0+3UxmmvO0Y9ieAXz6urm2jjAAwmjIGK1PjllkiEnm20/xjdXT4NNqTSXgvaMYFNzFRS2VoISAZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: Zev Weiss <zweiss@equinix.com>
Subject: RE: OpenBmc contribution
Thread-Topic: OpenBmc contribution
Thread-Index: AdjzZ2DKboFkgVuORM+0XUP0p9nbFQAnPHyAAAHn+gAAAbWKYA==
Date: Wed, 9 Nov 2022 08:11:34 +0000
Message-ID: <MA1PR01MB4129D517B4A4B2A26AE867BA873E9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
References: <MA1PR01MB4129305D091FE3210BA8A26F873F9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB4129D8BE91CB235EA9FF6BB1873E9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <20221109072156.GD18848@packtop>
In-Reply-To: <20221109072156.GD18848@packtop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Enabled=true;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SetDate=2022-11-09T08:11:33Z;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Method=Standard;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Name=IRM_test_300622002_ul;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SiteId=404b1967-6507-45ab-8a6d-7374a3f478be;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ActionId=1913e41d-f551-4c99-aa35-373151919c9a;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ContentBits=3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4129:EE_|PNXPR01MB6946:EE_
x-ms-office365-filtering-correlation-id: b38a9546-f4c8-4fc3-c586-08dac22a0463
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a2e8IGOFmNIFODNd/q9ETdwzC0v2oXThT2axa64O8I4Wqg06ChIo+9R83qfRu77Ip2s3SRpt3jWNA9F7vTWISaJ9IPODnNKDdvRcmuiUHh9U4kfPHsbpatUM0spyHo0gOcx3oBb84xyj9oNWzO+W8N6GMyPFfBWPo4tDKPibo1mcBYsIF0M0iqTFya/ywGG6EIJpzkdAP0ZCDsb5C6CX/D5GGCeQ/N+O2rSE1MYhFYM95y/Sr5wXnw9D136hPDX2huumxNpPg7DjWcywCbozqxyCE3zXqBwSXEuOY0jBkXLsCCkblORxJavjgK+sO+Rk+vQlY6wpYtvMx3vHxQjK0EQd5eullki4XXiojAGt1bQp1r9zePtrujVhsn6SKe8O0RcpPIu1zePze/3o5tNH6eqVfcapQhSlDZeGFGn7ePNxEF5cBz9vKmuvQzHox37Z+YkQf0WAgksI+4t1/o/1f6BhvKSOofN/cEzKJKfbFsl+TOQ0zNKFIMh1Isvx/QnllaqkIGZzEj/BHeNuFpvTswb/ATHQ9dTMgZ/g5oYNctdJAQ1QobIAkc1q2HUlLBTVsEZEZ+TVt2FfUFvD6yNs7qZdcoSPCB8gXIlcA6DQyZrvCuKTidv2N4aGHv4xIBJj98EQRACOiVexJwXTyEg+blxF2w89Dn+znTj2R5V6Ily2dZM+dVWPBI9aXY6iTMyif7MapQ6vjT3hwa/pGyzDA644wux1CQ27yQYCNAIF1njdwbBQ3m3Z233bDGbtx/GPXXJPxE4Dv9Ive4fwaljMEVb/104R3j4ZlkDZh9FGvospNcSWgkCYA3Fht3aCuhHb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199015)(83380400001)(186003)(26005)(9686003)(7696005)(53546011)(6506007)(8676002)(38070700005)(5660300002)(4326008)(66476007)(76116006)(66946007)(478600001)(71200400001)(3480700007)(86362001)(66446008)(33656002)(316002)(41300700001)(66556008)(52536014)(7116003)(8936002)(64756008)(55016003)(82960400001)(6916009)(38100700002)(122000001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HED8Y97qaieloF1YZ74aR9CVxbAnBIe3/k6oxtqKPxF1aVFG3nDh/5QnH0Gj?=
 =?us-ascii?Q?FyRWhyT8r10GaAs9bUEZ2CVE4up+CE7sDpLfUvNSAbtRNSlWpE83N86VfRAP?=
 =?us-ascii?Q?gF2E1nIJMl4QqLR+k6LN24B5Q+blvLcrKTnZDh66JKe0UR7szvSGip5nvHNZ?=
 =?us-ascii?Q?toR3e8oV/uTBP56aviQG+pqHLNK3aXyEz3k+Y7bQq4SCI9qpsO2nOvS6GFoZ?=
 =?us-ascii?Q?Cf8zfx1w5VhCVNnvigGIilyuRjNCnwETyiL70+JvGXuLVbzlL7gWVoIg4EXO?=
 =?us-ascii?Q?4iy9uVmAoes9e8mGJK/245tPyofQlq1u54ZZARpCDPkc13/KtIvXQzRo4con?=
 =?us-ascii?Q?juecx/NGRsUvDX7T8Oj5JRpdRRfOUbicSh9oID6vCeEoByEz3LSZyqNDG3qB?=
 =?us-ascii?Q?iAXcMqfLNkJaxfMgVkyTeSg6ye+UAmau2H6ZKnXjWwnhVB4TBC5H7QZVvUJ7?=
 =?us-ascii?Q?ZaofkLckb5x8/aYKY1vaBBrgYGtoIdkGhHUbwF9a90NuOePkV34L/GLZ13P1?=
 =?us-ascii?Q?XSnsn9c7xxjXWya5515XEU9NSJDu0cuoLt+TrDPEN1ow1klffmhOn3VOBHmf?=
 =?us-ascii?Q?AZ4BjBSxDHNrQh/30I6bPNWFkQJhceZ8eD0cQnMcBELBK/0DlU5BAcro+Vyt?=
 =?us-ascii?Q?kM8RE+tsaufprSu/0bRQSbtlaTnmYuL9QZ3XKRnNSbeFd7hREOwMtp7lPPyc?=
 =?us-ascii?Q?TYc7hKjt9CBXdGvVIMS40YtBneebsIauq31ImvaoBSZeSa0HvyMV6e4t/6D9?=
 =?us-ascii?Q?/NmJu7rtoTZc7w2vYlc5X6n3S4D8ReRSVORhdpPF1ySNIg4gM/LYAQhzDNNk?=
 =?us-ascii?Q?Mkhl70me2Akw/Ij/gmyMssoGvEJUuasnrYY6r+D0Stuy850I28m0yPJEZhyd?=
 =?us-ascii?Q?0vqsa8BhveBHy3lztDIbXPzYej9hCVZJToAei7dw6Nuk3Sg6bD9PELkKlVSJ?=
 =?us-ascii?Q?x3YZDPx66A4g3w4kgIAw4ZQXLsxaalo2AYDCi+DEKRMD2YeezdeK+4EpORTG?=
 =?us-ascii?Q?ehurugXfnq/iFH+cIDb5Iar3FmWpZWGeRemLim+N24YvEnXnhAsvF/3zxKMs?=
 =?us-ascii?Q?liSafna9/0E1ZeGrd8ghWiJgtU1BiCc83Xtmm0GzS6b7KjtpB63ly/lU6Dyy?=
 =?us-ascii?Q?YyJaEHkpm1NcYViU61xQ/YPKTn59K1jIczFP2J6xFqVn19M8xBTMUFVR3rPL?=
 =?us-ascii?Q?C5u6ZjHlH3Znk08meJcH7FQ8LoPogPSoNv/9oHltUIF0xlQmue2zzPU2Dj7V?=
 =?us-ascii?Q?T29YmAMmF1XNl/DqFSJlclpNZxXB9fVXtup5wUFBaThVVxbhY9lVzUQ6M+iL?=
 =?us-ascii?Q?5yQlBMwTnuM0HCxSJo2Fwi5aG8ZttRtmVluJhEEzTayCIEjST7vPwHD0r635?=
 =?us-ascii?Q?cUVNgx3KNx6d950RF3Hh/cjYymYt4ZO4cUUC7vv4+P6g4o6AyERP4cGErszZ?=
 =?us-ascii?Q?lSxX6Fx2Ox6J2jN7y4CI5hQG5Uc3jd9WC2pYJMrNfsGpNay7PbQOy89hccZR?=
 =?us-ascii?Q?hZdbuXWZojjDO0wvAYN29LNdXhKBE4OrJTkK3RY5uIXQVfjbl9l4815ZCp+E?=
 =?us-ascii?Q?91I0Aa8t/AjtzD2rcmU=3D?=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b38a9546-f4c8-4fc3-c586-08dac22a0463
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 08:11:34.3784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 74RgJA/N5wUnmX3C2TRajfBAUrpafm1ttRUCTs10PDkxNkyG+q2exW0i2uBry74h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB6946
X-TM-AS-Product-Ver: SMEX-14.0.0.3031-9.0.1002-27252.004
X-TM-AS-Result: No-10--4.730300-8.000000
X-TMASE-MatchedRID: VfovoVrt/oZiHm449d3ilm/6CCblACLhktxvVMaWMbAkt9BigJAcVsdt
	JW+rMozCBrK0xUCATVVJiK3ymB2wQQrgGFfN4HzC8eSmTJSmEv2JE9Tq+96NcswCk4rhHwXig7p
	bZl2hQA6DhGPRgXTgexxX8NnN7sPV0LFLoTAlSfyOFfLQqF6P0vNkoMDX+kiuUCgEErrUGFyn8Q
	2Liz3myBdcDteFMqMzJwIz1AZ/BFy/I3fdRCJNMc36paW7ZnFoF430d3dMHkbmYGaAzKkAUy6FC
	WVzhA8f4vM1YF6AJbZCITlsmPfzAAtuKBGekqUpIG4YlbCDECtruV6hT84yE71ACjrSnB9FMkO/
	tXekG6ROkvSd6osUPvmodZkd7ZhB8pFFlriu8YgEVszkMXcrdn9wdhiTTBPRGoTFA/ikPEln244
	eopsAhIF1jTYqYEdxVmmxOBaYGYUTjjQYDW1fK9ShZPtchUPC9nEogm/ztLQ=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.730300-8.000000
X-TMASE-Version: SMEX-14.0.0.3031-9.0.1002-27252.004
X-TM-SNTS-SMTP: 6687B56AE104D61DF6E3D34ECDF7B6B33D1FD5BE7B356B696F32B3A04F71F0422000:8
X-OriginatorOrg: TCS.COM
Content-Transfer-Encoding: quoted-printable
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

 TCS Confidential

Hi Zev,

I will keep that in mind. Thanks for the info .

Thanks,
Sandeep. =



 TCS Confidential

-----Original Message-----
From: openbmc <openbmc-bounces+sandeep.pkumar=3Dtcs.com@lists.ozlabs.org> O=
n Behalf Of Zev Weiss
Sent: Wednesday, November 9, 2022 12:52 PM
To: Sandeep Kumar <sandeep.pkumar@tcs.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: OpenBmc contribution

"External email. Open with Caution"

On Tue, Nov 08, 2022 at 10:28:01PM PST, Sandeep Kumar wrote:
>TCS Confidential
>
>Hi,
>
>Any input on the below query?
>
>Thanks,
>Sandeep.
>
>
>
>TCS Confidential
>From: openbmc <openbmc-bounces+sandeep.pkumar=3Dtcs.com@lists.ozlabs.org> =

>On Behalf Of Sandeep Kumar
>Sent: Tuesday, November 8, 2022 5:30 PM
>To: openbmc@lists.ozlabs.org
>Subject: OpenBmc contribution
>
>"External email. Open with Caution"
>
>TCS Confidential
>
>Hi All,
>
>Is it okay to submit our changes with testing done on a qemu?
>
>Thanks,
>Sandeep.
>
>
>TCS Confidential
>

Hi Sandeep,

Bear in mind that people working on OpenBMC are in many different time zone=
s around the world (and are often generally busy themselves) -- as a matter=
 of etiquette I'd suggest waiting a bit more than 18 hours before following=
 up to prod the list for a response.

To address your question, I'm not aware of any project-wide rules on that, =
so I'd guess it probably depends on (a) the nature of the patch in question=
, and (b) the judgement of the maintainer(s) of the repo you're working on.=
  Feel free to post a patch to gerrit with a description of the testing you=
've done; if the maintainers feel your testing is insufficient for your pat=
ch they'll let you know.


Zev
=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D
Notice: The information contained in this e-mail
message and/or attachments to it may contain =

confidential or privileged information. If you are =

not the intended recipient, any dissemination, use, =

review, distribution, printing or copying of the =

information contained in this e-mail message =

and/or attachments to it are strictly prohibited. If =

you have received this communication in error, =

please notify us by reply e-mail or telephone and =

immediately and permanently delete the message =

and any attachments. Thank you



