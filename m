Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3979B7855
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 11:05:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfKPW1DK1z3byt
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 21:05:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730369132;
	cv=none; b=DfartZM6xMnl+DhjINsuBxpWjUqOF2FXBbhdmH9AR/VckQBS/o2yLTNva1qDC4DPdEidVFoKWA5GLuN9mYmWQB9coV6RhGS9bzjdprOoy2x38xxYrOLCbx4goRjrSGWWLfeVcWaWnymkhGZDGz6Q1xtkqGt95sBrG2d8yI3sJ0FMawF5jkmsaUj/A1tVd//MCE+dfPZQCbVQlIC+QSWP07NaaDnEN7pYCdstT7RQOMnWJTyJeRQAZibE1snqf6BFdx1uj6AhvKfglp1BLnKtdr1LEaHWcFhVRR2Qhc9USqMbcWGXmT+jZbNgjjniWWba0Sn9RF/3PyyG6Rmt5Uz0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730369132; c=relaxed/relaxed;
	bh=g6RzNMEce3IxkBJ4liyJ4p8w6uH8zPUpi803N4AreNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VI7OljcHV6gvO6/F8DonOTDFDoZ/kIFwDfCjuiiTk54pv2KZ2ATL74n9ud6fKoc5ZWfWNOJ+y6Qzv9xNc0ldsqwQMWEOpqQJ8freP5FVjkNfYqT22SC4T6lacTToaqaeAEKt+1RUJcohT1kMk7CLk2rpnQ0Dj12xGryLEijgAnGCl9UHhUMOySxheE7v8960mtdg8aJvNoElRCpe05KhC5FQsNqTl55VuvsscppX+LmFyDnAExKqOhy0Vqcsq7HLRlKwrqbmHmsS3KtJbDNuUn2o43oNRx5pAg/NYr+3q4eFy+qrQy2Fyuhp0zbKzI6m77Tb131J5lA7E7MrjvDvhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X5eIM8b9; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X5eIM8b9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfKPM6BwGz2xJ5
	for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2024 21:05:25 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539f72c913aso1178988e87.1
        for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2024 03:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730369119; x=1730973919; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g6RzNMEce3IxkBJ4liyJ4p8w6uH8zPUpi803N4AreNY=;
        b=X5eIM8b9AQ3TyEysVj8anGe0vljZ8Sc2BFNW0KrwB71rTA0dajNjrzWrzI6rGCjNAB
         rnZ5Rgxgzo75cWyPa5C3z1xCsEl4PK/pfhX2BOTYvg8Ayf/i1WaWluHqYOKb7MVI9bWO
         OqJWSXui+rMSeIj5kDQQ4S+0g4HebNA0XAtOGpouNiEywg1vVGUhQp/hq4F/B/B4HNm1
         XGSXASiC8BVgu+8HnQZLimbSnINd/bxvtfYFvIoFYmZHEkB1k8278gD+BNRHg/v5FDjs
         +VMw+W8hsowBgg4UNwU9MFFl9BpJnX58Lk9wUGRE4G9Q+Xesvpab8f4cNdMR1clY4pOT
         BQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730369119; x=1730973919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6RzNMEce3IxkBJ4liyJ4p8w6uH8zPUpi803N4AreNY=;
        b=QOjJRSCC1Hra/sDOQC/z/6aFHOsx4h0XdNcBFuu87wqlcDYn0RSVqoDz9e11XdQb26
         2F0nMKxhoP5mmgu5P6L4x/i9tc8T7rr5//H04H9FWfFUbBz8ZqUQL9tIETc9TynTjG/p
         2eZo0wTIzCRkz5ey8yjs//EwwweBhFdl0gTNalsVrD98LbkiXRBD0lAvyWBV79hipdg+
         Yh+swIRUYBQkBOEg4d8Y+xWHKQb6ih5+MAipHHr97aspYSyGhSFZzreIzao8UaSS6ZTw
         bZEpYj4K7iqtWaivDBYSaOo33fGt+LTq9+dvgEVbLmgKnqR/YQgXIl0CgYOLaTJmAG+J
         gJHw==
X-Gm-Message-State: AOJu0YxekTlWlRPbsbQNi1z97zXjtPituOuxpc5Pr29xw7xcofOrwNVT
	af5Z4FJQT0iyvIOvRA+mKRNamsp30ACc3T0xZ9VUywe6YlNg5CsafEaCEg==
X-Google-Smtp-Source: AGHT+IGkBggGnhIHrVC9RJUhMh3faMG1e/RBs620mEPW2j9kVo5kXRpqA/6ssDC5dpUXoZlGltgyhw==
X-Received: by 2002:a05:6512:158d:b0:539:f675:84d7 with SMTP id 2adb3069b0e04-53b348e7218mr9885379e87.32.1730369119114;
        Thu, 31 Oct 2024 03:05:19 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9598dsm150799e87.22.2024.10.31.03.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 03:05:17 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTP id 49VA5DFw005564;
	Thu, 31 Oct 2024 13:05:15 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 49VA5DM1005563;
	Thu, 31 Oct 2024 13:05:13 +0300
Date: Thu, 31 Oct 2024 13:05:12 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Update on some maintainers / contributors.
Message-ID: <ZyNWWLJOBOPdmbVI@home.paul.comp>
References: <ZyMIJfBoYDPeJhxK@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyMIJfBoYDPeJhxK@heinlein.vulture-banana.ts.net>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Patrick,

On Thu, Oct 31, 2024 at 12:31:33AM -0400, Patrick Williams wrote:
> it seems like we should be more forward about what is going on.

Great to hear you think that, and thanks a lot for approaching this in
a more humane way.

>    - We are not accepting new CCLAs from entities on the sanctions list
>      or accepting ICLAs from individuals associated with these
>      entities.

Please consider trying to do better than the "high ranking members of
the kernel community" mentioned earlier and adding specific, explicit
rules regarding this issue to the project documentation.

In particular, it would be really important to clarify 

1. Which sanctions list it is exactly; for Linux they say they are
going to follow just the SDN and not the whole OFAC so even despite
e.g. Huawei is sanctioned they are still allowed to not only
contribute code but also maintain parts of the project.

2. How association of an individual with an entity is established. The
kernel people were mentioning some documents that a developer might
provide to prove they're not associated but it's hard to imagine what
kind of document that might even be.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
