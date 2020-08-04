Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0957823B460
	for <lists+openbmc@lfdr.de>; Tue,  4 Aug 2020 07:24:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLNVF3HVBzDqXZ
	for <lists+openbmc@lfdr.de>; Tue,  4 Aug 2020 15:24:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g0chmeNi; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLNMr72h1zDqY7
 for <openbmc@lists.ozlabs.org>; Tue,  4 Aug 2020 15:19:04 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id ha11so1362621pjb.1
 for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2020 22:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XTN3aFTyhTbke9Oqnhuf3EDQuA4939gq8P+SNrB5DqY=;
 b=g0chmeNiaG2HPyTMetgzMfbj0HEHfpE0UbwKwJi4y7v+tsgEozMTgbe+OnN52qNrFf
 pYUiKNrds7XOBfymYj9aCLp8CiTyZoowueBf9ya3W5p2cek36tQL1O4kUU4PiFkHGAlw
 N98UpzJ7WwwlGBZd4kaxRmWpzfocZwjn3wn6ALgOAnsVR8Cvob3kjN8VXlqz+9PwSKUq
 XHinIolB74T40X+Zu2n1ffdzb0ydoeBNe4VAStml5KaCtpFWbbl8MdxIW2URJgKfVq4I
 4nDfVgVR/cDLnoHAv7k2yeasIWU4DriMrRxXUjKlgAjIr5dEomM9OcH13Yw0+PgjXG2I
 SZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XTN3aFTyhTbke9Oqnhuf3EDQuA4939gq8P+SNrB5DqY=;
 b=f6upVxKyEbVT0BMPLZKwSJ+jqDlWzq0zRN6P1LiNFe+yURrpAF/4S4P5DdNUAGkEZS
 Sty4VEKuobsllWtqArW3PSq4xdZ0DoWGenWDKNXx5lcVHGmPaGz5BFHkAbpyYFmyYksw
 MjW8fohp7kIT2kZkmP54EcryH2f7mLWIT0uJ+qCfcO+W0sCVVUpS0c9syVjhOfLiWZvi
 riSde8r9Pk4TRNGIjG6IghDl9YGm8IQKoz2vFwzyUjEyIPyVr0hUSMUveAfSxnQito1X
 tTg3dqFItW3hvAFEOIvRPXbEHqtfs+FGLGPWZyl7UySYAv8ci4YlijjvsV2tQtkxB/t+
 PCIA==
X-Gm-Message-State: AOAM530pixsJ9fmT/V25xEFmTF+qSSvh663qU+0oBbrWIhEJk3BLaLlM
 e3eh99jXZ/DQCMgDLHHeThw=
X-Google-Smtp-Source: ABdhPJw45jHhOacxeFmVlaVAifwCP/wIPzzAznZGyhqzXbSY+OZEc3RUTcO5PQMW4BnWpQ74pfMnpA==
X-Received: by 2002:a17:90b:e83:: with SMTP id
 fv3mr2632047pjb.193.1596518341603; 
 Mon, 03 Aug 2020 22:19:01 -0700 (PDT)
Received: from cnn ([112.133.236.126])
 by smtp.gmail.com with ESMTPSA id n25sm21518961pff.51.2020.08.03.22.18.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 22:19:00 -0700 (PDT)
Date: Tue, 4 Aug 2020 10:48:56 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: add multi-host support in the phosphor-post-code-manager
Message-ID: <20200804051856.GA6678@cnn>
References: <20200720160013.GB17117@cnn>
 <20200721152016.GL3922@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721152016.GL3922@heinlein>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: openbmc@lists.ozlabs.org, velumanit@hcl.com, kuiying.wang@intel.com,
 manikandan.e@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 10:20:16AM -0500, Patrick Williams wrote:
> On Mon, Jul 20, 2020 at 09:30:13PM +0530, Manikandan wrote:
> > Approach 1: << run the multiple process >>
> > 
> > Create and run the multiple phosphor-post-code-manager process to handle each host postcode history.
> 
> I would lean towards this implementation because I think it is more
> flexible in the long term.  Some multi-host systems are hot-pluggable
> such that you do not statically know how many you're going to have.  In
> some cases you have cards that take up two or three slots, so you really
> don't know the correct topology until you've done discovery.
> 

    Hi Patrick,

      our platform also hot-plug-able and supports maximum four host 
      with different hardware topology. Do we need register and unregister 
      based on hosts inserted or removed from the slot. 

      The multi-host support on obmc-console, host-logger and x86-power-control
      based on number of host passed from receipe.

      I have updated design docuement in below Gerrit and your comments
      will helpful regards hot-plug-able host D-Bus creation and deletion.
      https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/35065

    Thanks
    Mani.E

> -- 
> Patrick Williams


