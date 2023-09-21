Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B527A959A
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 17:44:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SOmVBmIr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs0815xGLz3cQr
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 01:44:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SOmVBmIr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=dhruvaraj@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs07S1p0wz3cBs
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 01:44:02 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-401da71b85eso12154155e9.1
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695311038; x=1695915838; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PgaxKqq+VV8WuKNxNJDzUqfyisYmLEgxIXwG7xnljpg=;
        b=SOmVBmIrmwcqiDwoPuUp6UjqYLIUAa8tA3k5KOo7M0R9GA2TPuOAf85IBnwQQESiyw
         8DewLOxy+qXjlq91yMcyjEMIwasWIWVD4BiYZBDMwwamOO266dn8WWXiKgeQq5FvAAmG
         YQrhHh5fp2kvk1N6s5TNjXcuEoKSkU7ZnWLJwxK42OVWiaKBnI8K4Xu54Nvynrb9qeJu
         jOF24dubnVO/deBJc0BLh0bYnIGmPAADRC7z5LaH8g2PjZpbFoshfl1bxsAh92cyIcVW
         +PA+cqxdwV9kR25IhtID/5yQ6vy0T2tQ/ZTkMtabMRRZsyJNPNNjLHVhTEHWS+po8fRh
         1p8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695311038; x=1695915838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgaxKqq+VV8WuKNxNJDzUqfyisYmLEgxIXwG7xnljpg=;
        b=d8/2zLH0Xr8X0l7abxTYEG2qxH+ZnEmYdCPtLOhATI7kjJdgnN3xx4Wt9l/rXmI06U
         PSSXjLI0xSo597SE538OSKLeh3eURAcTUJJixj3RkVmb9jSZoH8pzSab7I2taRokXkvD
         EkUz/AGsZmUGtroULZAlGPJNO6unqMho6z0Cd09Xt75zrEYVJkV8J4puQgmeTe+ygFXQ
         t4lDGG3xnSAV93l5H7jaAygFqSouiFwJOgO3D3YtHQ09Csk6FhB8QjpXdr+H75qJLsp4
         ceKwYaUf2RAM/8efd1gpRhndOgbQFoUd32Y8Nz5rbJ1cZo9CTUjJ86a6OzG7xAo74okA
         wdQQ==
X-Gm-Message-State: AOJu0YxyEMTj/nll75MCmfL8NOXjXsExxJhN7+lAuYiNatGuLCUFR01i
	Qgf0VZRHbgIMgSyKgOU3AWAvmBtpCKhkf8NkOY4=
X-Google-Smtp-Source: AGHT+IEoTDtBOkpjZN+AJDVk6iSiNjb1OfVcn5KY6EjfRHRMxEXrt0r+nWnsLniZjuU4HGjn3Q7EQKIxkoduJDFFsa0=
X-Received: by 2002:adf:e643:0:b0:317:7062:32d2 with SMTP id
 b3-20020adfe643000000b00317706232d2mr5224731wrn.54.1695311038141; Thu, 21 Sep
 2023 08:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
 <ZQxjlifIOo96FJj9@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZQxjlifIOo96FJj9@heinlein.vulture-banana.ts.net>
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Thu, 21 Sep 2023 21:13:44 +0530
Message-ID: <CAK7Wosg0ffdvnEfok0EaRQym+EGbi8R+MXf_nVC9yXiEfozjNg@mail.gmail.com>
Subject: Re: Proposal: Removing redundant EpochTime interface from dump entry
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 21 Sept 2023 at 21:09, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Thu, Sep 21, 2023 at 08:52:15AM +0530, dhruvaraj S wrote:
> > Hi,
> >
> > In the current implementation, objects implementing the dump entry
> > interface implement both xyz.openbmc_project.Common.Progress (for dump
> > creation start time, end time, and status) and
> > xyz.openbmc_project.Time.Epoch (for dump creation time, which is
> > effectively the end time). This leads to a redundancy in specifying
> > the dump creation end time.
> >
> > My proposed change updates the documentation of the interface,
> > removing the reference to xyz.openbmc_project.Time.Epoch and adding a
> > reference to xyz.openbmc_project.Common.Progress. This is to remove
> > the need for updating the creation time in multiple locations.
> >
> > You can review the change here:
> > https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/66680
> >
> > Please note that this change will have an impact on any applications
> > that are currently reading the dump creation time from the EpochTime
> > interface. These applications will need to be updated to read the
> > creation time from the xyz.openbmc_project.Common.Progress interface
> > instead.
> > Link to the interface
> > https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Common/Progress.interface.yaml
> >
> > I would appreciate it if you could take a look at the change and
> > provide any feedback you have.
> >
>
> It looks like the potential concern would be with bmcweb.  There appears
> to maybe be some common code related to LogServices that expects all
> logs to have the Time.EpochTime interface.  Are you going to add
> alternative code there to look at the Common.Progress interface instead?
> Is this acceptable to the bmcweb side?

Common.Progress interface is already implemented in dump entry and
bmcweb reads that
for the status of the dump, now that needs to be extended to read the
CompletedTime also.
>
> --
> Patrick Williams



-- 
--------------
Dhruvaraj S
