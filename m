Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B81512F2272
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 23:10:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF7Dh0PVXzDqXL
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 09:10:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=XK+El6Kc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=SbFDcc0b; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF7Cq3Yr1zDqWT
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 09:09:26 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6C01B2397
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 17:09:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 11 Jan 2021 17:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:subject:message-id
 :mime-version:content-type; s=fm1; bh=rM/8/mD1S+BQZb3cgRI/eOWSP1
 g77yZSULXNLUz2P8A=; b=XK+El6KcwXhZRoTdlVrOc9p0rbQxEHiVzwkuB1jzGz
 iyg+xEz5PuDlCXg7WE1X1nVJP77L7NDnhcnmIHotCv12uAvZhIl7hR7idyumLGoS
 lDYBBjaQuSf87RtbpdXqmBeamoO59VHVFrXTzK9K9zWjffstvt2GunkF4HJ8932u
 4jSPZX5l8kbyYx3mXUpL4jpqWVVprOe+IjpLnqQ1SizfmDdlHQHhId7mIgkOJW0m
 4x4x93902T+4Ppn/OuxzVFS7EvHs3sVpXzpSBTUFnO1yatUi2FaMmfjaBwSFNlu6
 LekOOcznXnzSM+yTts9i4rcizszfw8SyxghBQkB3eRIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=rM/8/mD1S+BQZb3cgRI/eOWSP1g77
 yZSULXNLUz2P8A=; b=SbFDcc0b6BBpBCjt3QbsEc0/jp6qnbOm7EVGy4EUVUeLF
 IlJB/oVTJ+6G0Z7ceu4Nf3vH9nvcI7mv47FqjtG7LdEWEJlGWL9dpM35qLQbfmyT
 zsziJMGxhivP1thY6L6TiQLFJMy/jdZweZT1xce3DqjtVRj7D0XIxT1uQMJHOdcp
 h1BQRJWbhjaHmHtECufnAVA3vMaA0ejUWhBqs82sQ8CeOlvPNNAVr02GfVpxAGqR
 pt9Q6p1TnxCw1lZhp0Y76LQ+9BnDf0peYFEsURNIBXN97N+4B/JDZO3PIu8i20pQ
 rfzmfXhVhKlGdIPPSIdYOfJMvCHCdcc/5rPA5XGJg==
X-ME-Sender: <xms:kcz8Xw_T-Lp9Km5ZivGkOShrEe0HKTLXWskgNh9iFsh1ZFpPKJ-Xmw>
 <xme:kcz8X9BC_VoIIs0i6rB330-9NGMt98zlbN_W0OojzsFFhZqL-knSMk6As46Yh_xIG
 fdHdDSWujx2YtBKQqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgudehlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehttdertd
 dttddvnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehfuhii
 iihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepudehieekkeejud
 euueekudeftdefleegvedutdejhfekgfffgeelgeegkeelfedvnecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhenucfkphepudejfedrudeijedrfedurdduleejnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:kcz8X1IFMRupvOtx-oSImy3IOst9Qk9rUQZ0MWyTHMZVW6imR4vNXQ>
 <xmx:kcz8X4nnEFSZRghW-f4zIzyDKMztsxxcMbZfujrrAKzjtue7OLJZIQ>
 <xmx:kcz8X7GzAXAjRVQSUo714N3nvQlrLHQy0EWkVhMDfd9LO7elxiHf3Q>
 <xmx:ksz8X_ORMn-yuxLiGvzygcp22qfix8wpnFgZbcapS0xX1PTgi1qcMA>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id A4B4124005A
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 17:09:21 -0500 (EST)
Date: Mon, 11 Jan 2021 16:09:19 -0600
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: Call for volunteers
Message-ID: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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

Hello OpenBMC-ers!

Your TSC has been aware of the problem of fragmentation in our project for some
time.  Fragmentation is a loose term - for the purposes of this note consider
it to be any time contributor efforts in the community are duplicated without
thought given to maintenance and/or compatibility.

To begin to address this issue the TSC is looking for volunteers to serve on a
"repository review forum" to which the TSC will initially delegate its
authority in the areas of:
- new repository creation
- placement of contributed new function into existing repositories

The TSC fully expects the scope of this forum to quickly grow into the role of
a traditional TSC providing frequent, technical oversight to project
contributors.  The current TSC will continue to serve the project in terms of
governance, advocacy and industry exposure - and likely get a rename (OpenBMC
Board? or OpenBMC Steering Committee?) in the process.

The new forum would meet periodically or at the demand of other forum members
to:
- raise the forums combined awareness of new function under development
   (information exchange)
- build a consensus within the forum on where the function should exist
- inform the function contributor and the rest of the community of the decision

A successful forum would be a forum that can simultaneously encourage the
contribution of new and innovative solutions to existing problems without
introducing complexity to the project as a whole.

A successful forum member will have previously demonstrated a breadth of
understanding of the upstream OpenBMC codebase through:
- frequent participation in peer review, the mailing list, IRC, and Discord.
- submission of high quality designs and code to upstream OpenBMC
   (github.com/openbmc)
- a history of working with and guiding less experienced OpenBMC developers
   in a timely manner, enabling them to come up to speed quickly.

If you are interested in serving the project in this manner, please reply to
submit yourself as a candidate.

-brad, on the behalf of the OpenBMC TSC
