Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 487752D3577
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 22:41:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrDCW3J5tzDqh2
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 08:41:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=lxuW3PIy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ktswOHQw; 
 dkim-atps=neutral
X-Greylist: delayed 596 seconds by postgrey-1.36 at bilbo;
 Wed, 09 Dec 2020 08:40:53 AEDT
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrDBY4sKDzDqgp
 for <openbmc@lists.ozlabs.org>; Wed,  9 Dec 2020 08:40:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B4EA4580196;
 Tue,  8 Dec 2020 16:30:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 08 Dec 2020 16:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=ZPh
 9akY7ZrTWP+bv2P7jcCTcY6rUYVIIKFI3tEvWRrY=; b=lxuW3PIyUJ2pZt0B+YL
 r7zBD0SVZD5LWRl4MitG4r2DA6297YJzSQJzqNX+dwKzxy02SGeT8xnQiUDfc9Tb
 A1FXwmLQ6i5rfKCPXOpNO4PxlDROGPNX5JG08Hij7J+uhVtt3DgOPkWrbYXWdmqG
 IsPucq/XOFo9RvZwhS9iX48IzsoeufJhiOb39wbJSSVEGSoa7LOHEx3R7G0m5CEa
 kZeJ9gkiGrAr2+hooHEtba43LaSZtE5I5MpC/8LB/Ey1h8X9qoOjvicUPnXLxaUl
 TjJ9xjkz5+BnypxRbn3SwyxFhr4t4N2ktiOYceB6kNzoVJzcEBreK/E7AewjjjiT
 xbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZPh9ak
 Y7ZrTWP+bv2P7jcCTcY6rUYVIIKFI3tEvWRrY=; b=ktswOHQwSJLCRky/bpq0vH
 YWagDrQOnMngGR8BOGcjHkVoDUuLpEVYcFSt8FEypODMkuOxX49H5S0BIsnTPhD/
 hRBlKHvKvkSjI1AGRB/HzsCDfxUF67As9pyDIgGk2ClYPA2SE8np/4PbZHcLc94a
 ubl7yuoRDY00ohLKSLbYJ/v/j2sTkqc4G+tGWnYMhnCja+MuyZHxPVyResh6/pYu
 lv8WGjHLi9yPZahIhTVJn6pUERdL0rEE1e1S+IXIhRcjGUjI2DjIuSgx+lW9OVsx
 ZQoANn9EhKTBNTHGHrusvRkoErM5ROPZuHJOf3NE/eBQTOb2PTNGUTKYoWw4HHTg
 ==
X-ME-Sender: <xms:jPDPX0IO_DO746fFUth_YM6Y0D0f0tfAkU2H3dUhTug0dItUozrI8g>
 <xme:jPDPX0J67z9IU2nRWP9bl6Nxjy1urnQ0wsjmRi7aq-wQYRt08OzQ2c2_WJP8RZGJ4
 P3ZV0_Bg_kYmUVatds>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejiedgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeegheejgfeutdffteegfeefheeileejtdefgffhgeeu
 hfduveejleefkeejgeeiueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppe
 dujeefrdduieejrdefuddrudeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrd
 gtohhm
X-ME-Proxy: <xmx:jPDPX0uyBkmmjPaernQLscFJ1P1ftF-iqa2HyKuG9HnPfO6OdVF2FQ>
 <xmx:jPDPXxa4EMheebmIAeM0dXxAsIHAu9dt8L9gF0qwYOkEjvJpaB7MRw>
 <xmx:jPDPX7bpDTmJfGxAG9hIa4PmQTi8VzFVAQVodJEQILeoz_Hxm4a5QQ>
 <xmx:jPDPX13zGxTt6CysBTGMI8-FN2fFS74dqOeOr2XF18j7cG9tTVh48w>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id DE8491080066;
 Tue,  8 Dec 2020 16:30:51 -0500 (EST)
Date: Tue, 8 Dec 2020 16:30:49 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Subject: Re: Request for ssifbridge repository
Message-ID: <20201208213049.3fnst4b3qdwpa6or@thinkpad.fuzziesquirrel.com>
References: <1630860a-0de3-a89e-ab70-66ade1d8e0ef@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1630860a-0de3-a89e-ab70-66ade1d8e0ef@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 25, 2020 at 01:48:34PM +0700, Thang Q. Nguyen wrote:
>Hi Brad,
>
>Could you please help create a new ssifbridge repository under 
>github.com/openbmc folder? We intend to publish our SSIF bridge source 
>which is based on https://github.com/openbmc/btbridge but apply for 
>IPMI SSIF.

ssifbridge repository created.  Thanks!

-brad
