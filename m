Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2659D43D1AF
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 21:29:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hff00051kz304n
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 06:29:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=Rq+7c2El;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=bhDP9kz8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=Rq+7c2El; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=bhDP9kz8; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfdzV2V6Gz2yPP
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 06:29:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6C7705C017F;
 Wed, 27 Oct 2021 15:29:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 15:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=mij73IiDUuH/P/IQfrKrSfowCK
 o3FYo18mPVSxR75Qg=; b=Rq+7c2ElTOMLSPTAiAfyHnaKwXyVtkvdmejVBasPzC
 6W4PIPttQhhwkX6ZJXyvE77ViS/VPE83vsyxowSQMce3iJe3981WLvAwSA9VKu/Z
 IBAb0YNzO9m88wZ2hxWEBLruRt2OXa5yUli7UzY7tLJ4T3m4x38ubPXFDTFLEpnn
 dkcdEKng9Wy2QPS0WqnLNNJ3zblj7TEZmcVLuTdApUl7FyPQvfS0eFKXmdjgDBwg
 Lmq816oNWB6nOldwN6Sj2gZW8mQks6l7o9vu8FHn3DANBshhqpRoqvdgENB0QqhL
 wmdqNFU6uD+PbsNddBL4CrEimsOmf3BvcX7WLOBvgtYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=mij73IiDUuH/P/IQfrKrSfowCKo3FYo18mPVSxR75
 Qg=; b=bhDP9kz8u9CzuYW+xxy5PhkVfrGOvnKlZyldl74QIL8CS13rDN0CGvxLI
 qC6dMKlWBnUSq0LikzJtIXRdyjDJyVqJtSK/6YQJKBizI7DjjGlgWFaoPqD0ODd7
 XkuijXTsm4MRl+hEDNv92SHxPMwrO4gRnSoCGidrwYooPTnWJJvixmnvojiOGrJM
 SY9tXZzxjO5OFD1ROS7YFrNIOPHnvq2rdxiVlErab7/I/DNuiBtC2u8Vf2oCttrj
 luiwZvo0hjlOEpxV3HOtZJfUWBqB/sRyMV99ar9WqbVlQj+GpmVR0MroPFAvh/Bx
 ZghvZH9Dy1lht0K3WcmFNBea0CfcQ==
X-ME-Sender: <xms:gKh5YZx5jsmGsgZ4MGCEOt7LZeRkycxBUsMwFR14d8FhD_cH5OZxYw>
 <xme:gKh5YZQLsn7hTNfrOqdrIguM09nrpZLklryVjng0w8Tce0FmrDAsoBWuJlRjnzWjM
 LlzG1Ibs_MXX8_vpgs>
X-ME-Received: <xmr:gKh5YTU-BuTXzIbJUEHyhlR1sHN29J9AKaJGJ_bs9qcHMt4ZibqBCy6Xg7gCu2r1MWE_Tvs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpeeurhgr
 ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
 homheqnecuggftrfgrthhtvghrnhepudejfeetkeegiefggeettdfgjeelleeutdehhfet
 hfetudefkeeuieeifeefgfetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
 mh
X-ME-Proxy: <xmx:gKh5YbiGS0ajE_hVNM5BT37WrHpILExM8JSZA7B851viiPNMMdMpqQ>
 <xmx:gKh5YbBwFcc4xjiLclljCZX5SugiQ-TA9g943K189Uk7cZop0m40TA>
 <xmx:gKh5YUK3hQr1D_5LiWqV_Vhh14lqN0VeAaw8EXtNa5-9jx9Ig5NqGA>
 <xmx:gah5YSMDQcgDwcFtEz87bXI3Qv2J4DGJ0w5aoo62JvF0hKLTXCRENQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 15:29:04 -0400 (EDT)
Message-ID: <79311a65fd6e30f18b0fb038b1906fe5ec015466.camel@fuzziesquirrel.com>
Subject: Re: Start using github security advisories
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Mihm, James" <james.mihm@intel.com>, Bruce Mitchell
 <bruce.mitchell@linux.vnet.ibm.com>, Andrew Geissler <geissonator@gmail.com>
Date: Wed, 27 Oct 2021 15:29:03 -0400
In-Reply-To: <DM8PR11MB56387B6B7713360A95C7959090859@DM8PR11MB5638.namprd11.prod.outlook.com>
References: <62b15edd-110a-3574-66c5-d11299bbd38c@linux.ibm.com>
 <67C8A5BA-9FD5-4804-B5CA-C2687FC17889@gmail.com>
 <20211018184958.zajwqmloxsyxmxv2@cheese>
 <cd2f6175-475f-0e5a-0b65-4f7a12959ab6@linux.vnet.ibm.com>
 <DM8PR11MB56387B6B7713360A95C7959090859@DM8PR11MB5638.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2021-10-27 at 18:29 +0000, Mihm, James wrote:
> Brad or Andrew, Can we proceed with the creation of security
> repository so that we can run a couple of trials on security issues?

Hi James, thanks for the ping.

The only reason I haven't already done this was this comment from Bruce:

> > 
> > I believe we want to make sure that none of security advisories
> > get sent to Discord, wouldn't want to accidentally be going to
> > something like #gh-issues.

This was a good point and I'm not sure what to do about it.

-brad

