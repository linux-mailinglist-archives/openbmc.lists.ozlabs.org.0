Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5B1A6C204
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 19:02:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK9Jk6BCzz3cGb
	for <lists+openbmc@lfdr.de>; Sat, 22 Mar 2025 05:02:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::234"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742580147;
	cv=none; b=aDDqscVVmw+ym005A8tpccGwp25zc2pqaXtipMJexzGy/3b99DFLvPRKJvMl0J/V5pdGk5OxkJ/VwhUtbGJmJdY46tnVD84+iDQNlB06kVE6+jzRMkuKro0rXbtusI+aAh6jcUmwG4Oebcbndw0PTeaerhBIcB04dwCkuuAFyjn8pJNaR5xwzZUTGDxROt6kL2zdsZUeBseS82O0UGCo9O7prkPj1Up3TppirL7cMdfMXAq0oa+Kcvxwenv8Ju2sConUROVdTy9cvh7Md9sELWf3NrHEWrRHlCIgOwre99Hn4vti62HdFbH/hukLsPPXPYWUm9L0RoILlERvkOvedA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742580147; c=relaxed/relaxed;
	bh=fW3VbkIefqnDJdpzBILXHTO9vg58sQSrxK/6WCkfK4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQoHE43W9uts7dHfbS5bHU/rnbgkKwQwcY4RV4/nuaNwo5XJpYueDCupoVSX19tSQBOXiSCmzY7L7Ex9N13UC0wM9uffqm8dyl2/FtsLhP/qfk6hy85+efzOn1dAp6VZJ12TzHC28R3mZllVWP5HfMqFFfkf3oGUMxfMwrqmAANdI9DIepbN+A8nJQqPxv1yKh4r0QKb6DNjAyeZxmi6nLmDE+4W2I+5H7Ls4elyWilyU5jwrMpvfrzuIxgmn56V48ZjctwcJwkIO8c8fr2VeLJ8/fjnI3gzffrHmjHqaO7Lc9Hv43L10NLwWNPy0V8OJVI9YJ7bJrH3IxKBpYdDmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dYoq4XvY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dYoq4XvY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK9Jf1GN7z30Ql
	for <openbmc@lists.ozlabs.org>; Sat, 22 Mar 2025 05:02:24 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-307325f2436so22993571fa.0
        for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742580136; x=1743184936; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fW3VbkIefqnDJdpzBILXHTO9vg58sQSrxK/6WCkfK4k=;
        b=dYoq4XvYM+qy/dunp4ScG4EuI84qbUUdlsF3Wm4G5Ql6N68jRxAqLGXeU12I85OQ+0
         yy16npMdgGRjXXks0YXazw87Pm1pBpuqeiE5Wk248VdkLCKNqWjDFvRSbJB9vZhJnwDY
         hS5Xc6DSTGT7FbNolW99Q2yZ9hh+F17Ad80j+6S9sUciPeIetC/9yf8kXJh9L0bQ/v7p
         SGLhLIysPnlrS1mUbq5AIAoUXvPQb2McjAuZ0ROlCVUGX2n11yPkKJRteNaMgix9/6NU
         6eZUptK221IXJ/moRFf7nHkjljAl1S0uhhXrUMkpB9p3ZjQeKnmO2kl0QLJjE5SZ9x7U
         8+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742580136; x=1743184936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW3VbkIefqnDJdpzBILXHTO9vg58sQSrxK/6WCkfK4k=;
        b=Flhn2mDoDMln4eHnB5e7gNx7buCG4g4eoTCZZVhv6KmBfl19kAbyntSiUR9tmwP4TF
         ktkZWiNiqjK3J+5NivAEx5/j33GX5qYp3D4NYyKQR4Nj+M0s4nJNvNYuooLBFb5gC0HY
         NpPjFFhZW5Du9v9ldVepdyLBb8ZX2lY9wdYhi4ApaL2+X0D4RZjyOxCwHZo0kwGgpGK5
         OtLqzaAXFb6iSTg/VDZiu+tuAwsUU+p/0GC+wgWaCklXu0utfa9O/D7UzkzdOehMhewf
         IbgpL5j4VWPMRw9DJtIn2sHteNL9AgKV1k6v7Vl9dXFYZ/fWwkVUOj5lQWYWyGK4OYk9
         ulLw==
X-Gm-Message-State: AOJu0YxVdikmlFEImXiJG2+it7mia14EMNBrCxgqqvHLyy6iW3TIZJwv
	q1BYi4H4FmGY6SGcQXdtSQ0omJcifJbvolmTEqVdqiTbJ66s/FWQPhgKHQ==
X-Gm-Gg: ASbGnct8SrWCm5ChhJN0jCSvp0kCMZ+wqtvSaQ9F0SlLpT9i1vhWlZ0rTfWWEctdWaP
	B6DBgsOrKSe/LNLO3VCUlLRpkFz5bNJb4JhgWtxbPuIfIiedcnjn/ICOQ8Za62ZtwQktnNrGM35
	h3fEQokgmO18HqOylQDWyZ1OHY3Ij3zXgTzn5+9cszW2HXeIDA/zNvLIxogbuU2fVZocMkOdGZt
	5g2orPatgEw5DrWZ68uNLM6jNUk4EE44jPJfoRwyH/yGCNmULNhSs1TxHfa4c7CxfAiUGO9IB7L
	FraCnobcxWdOjnt5t+K0eVUyAiLQ1Jj92xq1wN96g+gU+92N+400xbmt6HHS+VjgqfO8ig==
X-Google-Smtp-Source: AGHT+IE6wzaMJG5y//O362vxRTKc5vyjfEJrpkaQEigI3MSWRUx0b+teT1uSMfTBFSKqB6zvGOWwaw==
X-Received: by 2002:a05:651c:a0b:b0:30d:7c12:5725 with SMTP id 38308e7fff4ca-30d7e2bac17mr15163431fa.33.1742580135686;
        Fri, 21 Mar 2025 11:02:15 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7e12a5sm3072211fa.44.2025.03.21.11.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 11:02:15 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTP id 52LI2BEE005681;
	Fri, 21 Mar 2025 21:02:12 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 52LI2BdU005680;
	Fri, 21 Mar 2025 21:02:11 +0300
Date: Fri, 21 Mar 2025 21:02:11 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH 2/4] net: phy: marvell: Allow targets to skip MII RX/TX
 errata
Message-ID: <Z92po2d3F4bkYsJH@home.paul.comp>
References: <1982610042.19586749.1742574604453.JavaMail.zimbra@raptorengineeringinc.com>
 <Z92lMNqRcWrdmMrS@home.paul.comp>
 <1222768696.19599951.1742579451325.JavaMail.zimbra@raptorengineeringinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1222768696.19599951.1742579451325.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 21, 2025 at 12:50:51PM -0500, Timothy Pearson wrote:
> >> +		/* Per the vendor, certain Marvell devices will not function if
> >> +		 * the RGMII TX/RX delay registers are modified.  If an
> >> +		 * affected design has been selected, do not write the
> >> +		 * RX/TX delay registers.
> >> +		 */
> > 
> > This doesn't say much. Please reference the actual errata document
> > number or cite its text or find some other way to explain which
> > devices are affected how. Proper implementation depends a lot on those
> > details.
> 
> Understood.  I am navigating a bit of a sea of NDA restricted / proprietary components here, apologies for the lack of detail.
> 
> Let me see if I can get that information and get approval for public
> disclosure.  These patches are in support of the SIE Cronos board,
> which unfortunately was designed by a third party without proper
> U-boot / OpenBMC integration in mind.  As a result, there are unique
> hardware decisions that were made, and the DT is not authoritative
> on these platforms.

DT should be capable of describing any hardware, that's what it's made
for. If some particular property is missing it can be added upstream
and then added to the board's DT. It's not yet clear from this patch
and its commit message what specifically is unique about this board.
