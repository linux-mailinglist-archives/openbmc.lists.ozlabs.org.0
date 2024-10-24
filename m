Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81FA9AE0AE
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2024 11:28:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZ0vx2xW5z3c4V
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2024 20:28:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729762107;
	cv=none; b=OZrLWibx3UD0yoFaPnmasprW0dslgJTcvHLZhDuyrmM2d3yQW0OQ/BP+He15BRSxiDJvHuHVDSQGTISCagyOyIEiMS0FXhlitVr+Pfgk5zkB71VSsgjL4dgR0QFQK0wB8i3an4G+EJOP2aFXu1rr0mTgENI6WueZM0cRLk4MAL0REgIUzVleGcx0y8MMYE/TC8YhqVPzwOfvYubjE4lM/wa+VvH+qfF5yKx1Cw1dcMSgdVEQFdFWo5FTs5PuoQsF+1Jo/2a9rKTSS6nGKV6om3dTuQu9ZoYYt04TQeqBd6g7JwPqERccABI7nuBtGIVBIJC2jxmM3I6+ybFnUBEJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729762107; c=relaxed/relaxed;
	bh=RhDoOVohKrVQbC1ZKlpYeCb3uNhZdIDe0A7fT4/T9nA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJUDcgT/aN+To9NdfVpDTkJ8hwuQvNQq4djHnT5DAL3EZ3v9COTPbjUnvItjNiVLRlVRE5pkh7xbD1OuKt3erBkKO9hBzUMOP+3Dw66mSr+8Gj3euv80dixsDe25aOvQkZq3sz8ryCOfOUl0PtIUjFGlbLPObe4ChJEH+jSvk3CAcdyI1wBYSk/e+7Xvbd0bzSlhh/xWj0M89ZNB7QeuUqUQWHd0Ert5UVGSrMOdggRFl1PtK0NlAWKQjtvpuy8xoooIRYvFb59xNoUrQQhavGMJI+yt86T8Ok+p/37rIinsGDZBUh65WrOFCEvp49TTcgSrkYRYgjuIII4j6AywPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=spum1RnW; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=spum1RnW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZ0vt2ybPz301w
	for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2024 20:28:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 09C39A45286;
	Thu, 24 Oct 2024 09:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAD4C4CEE7;
	Thu, 24 Oct 2024 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729762102;
	bh=fpZS2foOhIzknpZzRCdMwXYMyunLK4oDNzT92es9hpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spum1RnW6kPn60EfTEu9IM4h+2F4Z7UJECedzefe49Z9psqdU5WQRu5PSa5xHxvB0
	 ctap6yaNpLrPTEGPliSbg/2b8U3iKGr1BzlAbWSL9PQkXt8k64vVzUrNGIXaKPxfWa
	 UZHOengOghgPQchAgCRJXgypakIbIVHmkZBMeDnDd7CfC3KXJXWCpbDRNVDQCe05NT
	 RzatV5taDaZ9WVPM81j5qjyHMPHM4iJk2nJIVLOn/mxxskGqKjFRwu6i8BBnYW7PVS
	 EiSwQGcfefHX5FltuvrextsD6jjRf3PE6Iqs+lr3tEFP9jpq2QkBHC4HklaqJwBYa6
	 68TZu8Lquwrnw==
Date: Thu, 24 Oct 2024 11:28:09 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
Message-ID: <n4buyofrjkgvbgimcziqpm7hfba6du64lbe4aa42d4dhyx6zdn@m4ofnrx66ww6>
References: <20241021062732.5592-1-kfting@nuvoton.com>
 <20241021062732.5592-3-kfting@nuvoton.com>
 <67d34216-e98b-43d9-afd1-2e73ffb71968@molgen.mpg.de>
 <CACD3sJb_xF_wYuLEMV3yF0HdtrOX3vnPUdZ6_x5yof7yj4yUNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACD3sJb_xF_wYuLEMV3yF0HdtrOX3vnPUdZ6_x5yof7yj4yUNg@mail.gmail.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, tomer.maimon@nuvoton.com, tmaimon77@gmail.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, KWLIU@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tyrone,

On Tue, Oct 22, 2024 at 04:08:46PM +0800, Tyrone Ting wrote:
> Hi Paul:
> 
> Thank you for your comment.
> 
> It'll be addressed in the next patch set.

No need to resend, I can take care of it.

Andi
