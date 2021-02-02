Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A66430B42E
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 01:32:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV5Ns1vQrzDrdK
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 11:32:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=Z8CUGmHm; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Q0yt3ujn; 
 dkim-atps=neutral
X-Greylist: delayed 566 seconds by postgrey-1.36 at bilbo;
 Tue, 02 Feb 2021 11:31:15 AEDT
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV5Ml5TrhzDqP1
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 11:31:15 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2D2815803D3;
 Mon,  1 Feb 2021 19:21:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 01 Feb 2021 19:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=okE
 uHuTYH0tmKCAqogpzi8elif2cgp38DqOCMruScZM=; b=Z8CUGmHmTStwTUoTxr6
 G75VQi61i+QuKt8rpetlizwD0ICznauDCV3kh854tE2vL5VZ86ltAPa4CzIrZtmL
 4K1xl3FFNaF/3waqSB2xXOic6E54ImgbQrUVP1w/vQlXxf6AnzsY5b4DOO5Kym7/
 XoS1cqrUUlC+qNq1JM8/NE4/teyJctN9TM620rjLCdJfdZKgIVWUbWq6aoM5zscu
 U38A/X4wR3HsFzEgH/pu3he4+gdujxb4V1v6vkKgDurzbQpdCgrzwSVhIeVSFoPx
 Z3H83Je6qLn+ZTrJKB4inydi1GRKe5MS0RNRzxgSwZiXriT8NOyDeobuO7D1oWn5
 WYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=okEuHu
 TYH0tmKCAqogpzi8elif2cgp38DqOCMruScZM=; b=Q0yt3ujn7thB/EvVO/VscY
 kX9aYh3anbychtNKFx9cml/BqPxmwFl7TshCke4donx6Y6BZmc2MPFpfsFV1h/lp
 K9nL3eX9CQymb3eCLdd1vvKfY68BljhqK5iaDSwvYGM5pVD94EyPf88WRQ1kYfxc
 9I+EEBl57nxTSbmdy4RvC8ZSTKw1S5U2nsVYKQ2WUlSJP4qak0cnaXJUholpGrOf
 cv2u2OT1oUnRNpGnCmdI3I8UFy0vPGmsud+oe5TmiqPOQl7ir2Xkd9bqmKQAms1I
 2WYq5v3NORmM2Ae7tLofOFwwwamgUdCHFfqmtRuUMokIxst2+qKJ/F0HkBZWKTSw
 ==
X-ME-Sender: <xms:FZsYYD0048cC9OewjMyWbIZ-XXs7JmYmZ635dDpudoZKtBRS1WaB7w>
 <xme:FZsYYCEo3pIeYR3xgwfARNwrRh2n6VnIPBbljwHD8KduSPTGUTqGXt5ZLFgf1QzO-
 3v0v1b7TQUF_7hnftE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceu
 ihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeekfedu
 feeuvedulefgkefffeenucfkphepudejfedrudeijedrfedurdduleejnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:FZsYYD4UcbQv6v7z2X31Pwd58CTRrun8oGDRZM_CIuu_5xQ4HO8i6A>
 <xmx:FZsYYI2-YB4tdApS8jNo2epogfPaRMagSFsoyAPpiUw8ctjMoFh9oQ>
 <xmx:FZsYYGGUowbGj11U8GSesZ4OOgLWvn-k-xuYT62QAmpSLAtd2tD_Tw>
 <xmx:F5sYYJCcBs2hf3FyLrfqHZ2cYIgky8mJ3l1cf0Nl8rz3vGXErPFGRg>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4004B24005E;
 Mon,  1 Feb 2021 19:21:41 -0500 (EST)
Date: Mon, 1 Feb 2021 19:21:39 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Progress Codes in BMC
Message-ID: <20210202002139.jsjkl4icge5bf5cb@thinkpad.fuzziesquirrel.com>
References: <4795347F-477D-45EF-A145-0C7B163FE01B@getmailspring.com>
 <CAM=TmwXEmFc95mBEg4G8bUNoBq7qDL9i_vv=YtomRDrVPDYBEw@mail.gmail.com>
 <7821f27b-31d5-a9d9-a6e6-d709e5456af5@amd.com>
 <YArmnhlS33TpVo63@heinlein>
 <20210128010526.wice3o5qznh4lglw@thinkpad.fuzziesquirrel.com>
 <YBVtvlsJJJ4faFpt@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YBVtvlsJJJ4faFpt@heinlein>
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
Cc: kunyi731@gmail.com, anoo@us.ibm.com, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, ed@tanous.net, gmills@linux.ibm.com,
 vishwa@linux.ibm.com, Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 jason.m.bills@linux.intel.com, vijaykhemka@fb.com, wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jan 30, 2021 at 08:31:26AM -0600, Patrick Williams wrote:
>On Wed, Jan 27, 2021 at 08:05:26PM -0500, Brad Bishop wrote:
>>
>> There are multiple sources of the codes - on Power the power sequencing
>> is done on the BMC and that is considered part of the server boot so we
>> have both those applications indicating their progress along with the
>> more traditional progress flowing down from system firmware.
>
>The `xyz.openbmc_project.State.Boot.Raw` is the interface to use here.
>You just write the `Value` property.  

Ok.  Do I have it right - on any application that wants to post a 
"progress code" you would just implement this interface on a single 
(arbitrary?) path and continually write to the Value property?

>> Our progress codes are much larger than 64 bits.  More like 64 bytes.
>> Does that still seem acceptable?
>
>Maybe we could change Value from a uint64 to a vector<uint64>?

Works for me.  Does anyone have a problem with this?  Hoping the 
existing users of this interface will speak up - I've CCed them...

>> I'd also like to sort out the external facing interfaces for these codes
>> though.  My straw-man proposal would be that these are just another log
>> service with yet another additionaldatauri attachment in the log
>> entries.  Is this a terrible idea?
>
>I think you're asking about Redfish now?  I have no opinion on that.

Yes I'm asking about Redfish.  If any of the bmcweb maintainers could 
speak up on whether or not a LogService is the right path to take here 
_before_ we get too far down the design path that would be fantastic.

thx - brad
