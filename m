Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA203068B7
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 01:38:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR1mp5HsRzDr4h
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 11:38:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=RanXxBKM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=UAuzOmV4; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR1lw32PpzDqSc
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 11:38:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8105E5C023A;
 Wed, 27 Jan 2021 19:38:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 Jan 2021 19:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=0mK
 +Xwz6OFanM2YRsQ3umZQnoZaTaWXutnQE4A8V+wI=; b=RanXxBKMtgxfqq1kWxI
 Z6W7kWuo3qHH4CiLMJD20JYQujv6/yg7pFqN/1I9GI2pmdI0DTIeVAmmHuwin2Lx
 ON2fNU7RIlDHl49fYvdCo2RkV0XPyhMw1CiGE/U4ddHvCCuOadbtVFZBECQ6EDKU
 EwmHoLjQdlCFkWWmS8ti583z72cpDxYfqGjNMD9f32iFh/T0siKydz98HypR8tqw
 1KDNXwJ00RhrZE4jPvncNDdQ44gZrEmRAouJnasAtHGgrz30Vm0gzbF1GkxIS41e
 SqQv/xqXzl7dZX6wDVWNDLTB9m+nDMtVh6S1m7vhtuZiEMGhUvR/o1cdzPvIyJ3Z
 7nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0mK+Xw
 z6OFanM2YRsQ3umZQnoZaTaWXutnQE4A8V+wI=; b=UAuzOmV4M+KscxPldrrPea
 do3TepqV0MRFnCaojfWXJPdmYISOyIc+8xVeIzSrviZU3Yo5xj4PtSEMNEzZZmVC
 rRyavzFOLbE8dvh6KC/oYDhtJkHLSiqaZyKdYIqxLR61zArIKJ8g7ItsRwdCRjmA
 UE2z6yTlG5uI40WqKIbE8/jRPd65Isg0zFUlDXZPtS21cwtoywg0Q6SV+PnLjWcA
 +V3a53T42td6ue7qCuCksi1ToA7xk3+uxG8UBK58YrAro3E4BtNepnnCPjexdZbB
 dqnPG7YYAPZtuek1ErlLEGa3mfh9GHi1tqesCIs7WJo/UtXjlsNTCd5WERCO1Dyw
 ==
X-ME-Sender: <xms:aQcSYJoL0gW5w4cOz-BcBUqFQdvjFUzn6iFIWJ8xFkYcXqTjpczJEg>
 <xme:aQcSYLpoybbBDdtdgog9eqhEwI7ZRNUQ7GIZom7skCZeRZKW27AWWPqcoU0nM_YEx
 YU7ATCqIozIJZk-vCc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceu
 ihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeekfedu
 feeuvedulefgkefffeenucfkphepudejfedrudeijedrfedurdduleejnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:aQcSYGMLsZYmpaXExsVMfWXX-Qo3C7OPzziYfkUrPMmo5Uifzi99CQ>
 <xmx:aQcSYE43xNcwanvMQ5PmSOpWaGqeGdghAHTaCdjBQdAp3soAhFZCDw>
 <xmx:aQcSYI5kZwSiXFnHRWqEGSH0eCvL8us24z1vRo-bhuI6Hi7uNCaowA>
 <xmx:aQcSYNgRga3SPC8y8_lAVm7FBsUKj2K9qSFi0r3S54QMi_BbrC5kyw>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id D1E441080064;
 Wed, 27 Jan 2021 19:38:00 -0500 (EST)
Date: Wed, 27 Jan 2021 19:37:59 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <edtanous@google.com>
Subject: Re: Gerrit owners plugin coming
Message-ID: <20210128003759.yxpynaoypt5oummc@thinkpad.fuzziesquirrel.com>
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
 <CACWQX8236dghCCdnDAdnij0Di_GF7DsmAO_xEtWmk6ckKDocYg@mail.gmail.com>
 <e18c023a-ccb3-6591-1092-cd488cd331e9@yadro.com>
 <CAH2-KxAC1r2tSOmbCyyvnYcY0Z-iyW97FoGHbtzitVNH1u5jow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2-KxAC1r2tSOmbCyyvnYcY0Z-iyW97FoGHbtzitVNH1u5jow@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 27, 2021 at 09:09:56AM -0800, Ed Tanous wrote:
>On Wed, Jan 27, 2021 at 4:02 AM Alexander Amelkin <a.amelkin@yadro.com> wrote:

>> Does this mean that meta-<vendor> directories are not subtrees anymore
>> and respective repositories are now obsolete and can (will?) be dropped?
>>
>
>The intent was to make them read-only in case someone was relying on
>them directly.

I removed all the ACLs from all the meta repositories in Github and 
Gerrit today.  There were a couple patches that snuck in so I also ran 
the subtree script one last time for our own subtrees (Andrew will still 
use it for pulling upstream - e.g. poky, meta-openembedded, etc).

-brad
