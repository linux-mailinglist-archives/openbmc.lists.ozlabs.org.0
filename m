Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E3D6C25
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 01:42:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sZpg5DQpzDqRR
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 10:42:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fZtvEivv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Zfr+O80U"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sZp4347pzDqvp
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 10:41:32 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D3F520A34;
 Mon, 14 Oct 2019 19:41:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 14 Oct 2019 19:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=/4WP/WnIhk17kusyYbsRlNkYhhrSgXB
 kM2fISQscqtQ=; b=fZtvEivvf5KDBIhrujm58phd+83UdbosG8qXEO+6LBKFfIm
 /Ewhx5+rrQgBZcCy34R1FQ1Op+E6NCc752z1GwHvQsS3udlbihqLSHQ4UrHzLUku
 hU1msIfCnGdezcl4yf+LRbSmlNOGK3kk2ZfO+b303k3s2zmFAJz96YXptM0NTL2Y
 +UxBFwjKYdZ40EvWBQ8/f7iO5/pWBLumFHKKKA3Owjty1PxF3iBrT3wit1HB3+HX
 qlutiAr8om+HmKsjEm5wI+nScd2TTgT06SMmjU5HQ82pCxTwQYZqDvjeSBS7QWtR
 2vFcrT0Sz8Vbl7KTIyhVWmymRjZFIoKvEX2O06w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/4WP/W
 nIhk17kusyYbsRlNkYhhrSgXBkM2fISQscqtQ=; b=Zfr+O80UYJuW6XxAefAFWh
 yklvEDd/HjNzjYNpGb65RSDKBEdM1spTgdFDvGjREYjUEcG80iErN/eJHjTg0FjH
 DrpiUPRC+/MglCvgQZlxPObWPInCSs1r537U8tIumISaMDxnsNTkT6SxCv6Za9LJ
 IxBze8OzGA8sXsL4Edro+0rj1UxZ9QQPLtz2PQOGZPWZtSIvVox1qmFKsu18001f
 YkduAmLmMki9Ru9YF5yInDply2gep5Isv5W2ojNBELV8Qxfk4+LmWY6E+lAWR/QE
 Bnq74MMiDgHWXldDh/oGlYp/jwUclD5DxUNfItGsxxIwG56ECAPWg8Qpe81IVPcg
 ==
X-ME-Sender: <xms:qAelXfizU-LGXHNPYaNotSgdz2eBMBavDfN6MYjuCue3M6gJOfgynA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjedvgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:qAelXQRmGSv2VqlGjgFCGlgAobAh0VOcS3ksaiZIZ_qTXZWWF84Vng>
 <xmx:qAelXaH00nCrDKWAMoPByuswi51kJVWJOqvxWfvYUvtabP4Q3asmxQ>
 <xmx:qAelXQnYBcOt3wYNxfqtNXQ-KcwkAQdk4APXcbKTuVE_A8SknUHKlw>
 <xmx:qQelXXy5DnP0CKi4deOh_XfzDDnR1cuOFvZt2bTUkuMdOvEhyIVI7g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1599BE00A5; Mon, 14 Oct 2019 19:41:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <e4c94ec6-8ef3-434c-8e25-6481bd4b0d50@www.fastmail.com>
In-Reply-To: <20191014132140.7618-3-joel@jms.id.au>
References: <20191014132140.7618-1-joel@jms.id.au>
 <20191014132140.7618-3-joel@jms.id.au>
Date: Tue, 15 Oct 2019 10:12:23 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_2/2]_fsi:_aspeed:_Add_trace_when_erro?=
 =?UTF-8?Q?r_occurs?=
Content-Type: text/plain
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 14 Oct 2019, at 23:51, Joel Stanley wrote:
> This prints out three registers in the FSI master when an error occurs.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/fsi/fsi-master-aspeed.c          |  7 +++++++
>  include/trace/events/fsi_master_aspeed.h | 18 ++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/fsi/fsi-master-aspeed.c 
> b/drivers/fsi/fsi-master-aspeed.c
> index d796c4012875..66657b7848de 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -251,6 +251,13 @@ static int opb_read(void __iomem *base, uint32_t 
> addr, size_t size, u32 *out)
>  static int check_errors(struct fsi_master_aspeed *aspeed, int err)
>  {
>  	int ret;
> +	u32 mresp0, mstap0, mesrb0;
> +
> +	opb_read(aspeed->base, ctrl_base + FSI_MRESP0, 4, &mresp0);
> +	opb_read(aspeed->base, ctrl_base + FSI_MSTAP0, 4, &mstap0);
> +	opb_read(aspeed->base, ctrl_base + FSI_MESRB0, 4, &mesrb0);

check_errors() is done unconditionally in the read and write paths, and these
reads are unconditionally done on calls to check_error(). Really we only need
them if an error has occurred, so I think we should do:

if (trace_fsi_master_aspeed_opb_error_enabled()) {
    u32 mresp0, mstap0, mesrb0;
    opb_read(aspeed->base, ctrl_base + FSI_MRESP0, 4, &mresp0);
    ...
    trace_fsi_master_aspeed_opb_error(mresp0, mstap0, mesrb0);
}
