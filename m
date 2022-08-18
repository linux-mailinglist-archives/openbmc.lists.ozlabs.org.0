Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E457A59825D
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 13:39:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7jbV5zlZz3c7y
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 21:39:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gx3Dmoh1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gx3Dmoh1;
	dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7jb15jdGz2xrW
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 21:39:07 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id v2so1765052lfi.6
        for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 04:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=hKHIrBqLsHgBi7uTS20F+evza6xJ7dfZtAkztONorHk=;
        b=gx3Dmoh1oWsveKn7FQHI1TMxm0fiLddJgKDI1uyIOH9MHQJDiwjBgUuTqZu90ux5Mv
         a9i+xiS1QIcxHnXStK6cLx83RzEahhbx9iL0iWZMixIViMe0z0NFu207sEUW4j2GBaze
         MfhzrlitRBdoSITrlItRZWPnHU4bSVLnIzkh7P8+q/eT93UIPzl6ml4SZdMvVbiy1kHS
         mKRXT3dpfZQHbwNXW0Xx6j0/dKTi+ozkL+otUllW+OzLzEsaFnrz+xjtLNdUdh4uE90+
         2nMtfzYCB3xqpK7+IfnXPawf4YFHVQdvhLs02Vj/0sX8snO569F4sbH3BNtkIehvCUW6
         RHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=hKHIrBqLsHgBi7uTS20F+evza6xJ7dfZtAkztONorHk=;
        b=H5cUgyS8j2SKjX98TZ5JYOlSNDLiLN1qNB1z+DuPTuOq71Wx7pPB8D5ZSb+e+yJjsm
         WbSwCGsf/uKob1ZUv1hzzE7E8WHK+9at3UiF0qO58/WN46KNS8kO4F1jgutt/DeGT36U
         yoFZe3MCYZ5A+gdUMor9JLpWzBzE4AGlx6u4ddSo14hl6efRUgtbpuOCoiV/69rI+ABM
         6G0Y4pZiK36HudgjuKhF8UzqhE40VKYT63g+K9foH2OX785uWrNc2sycal6hRT1AsO/X
         V3DaQEe9c+XOxDHpbEtzCs/Ilb5K8F8mKijs0TPFzTqoVNkHjCiJfEKlykiuvNYdAQkW
         96rA==
X-Gm-Message-State: ACgBeo2mR9DoNKeKycA+oYTsp4Lq6VoVIenL35Vjx3TrGf8K5D02mzJF
	0PShCi0lHGqkmV3rBtnRVRU=
X-Google-Smtp-Source: AA6agR5RV29IM/rKt9sTLfUQuA1A1t5ccsUOS9iRTsMr0Qzh4kosAOfbNvTejleoKl7XRjIXzpWWVQ==
X-Received: by 2002:a05:6512:12c1:b0:48b:31b0:7c5e with SMTP id p1-20020a05651212c100b0048b31b07c5emr832877lfg.114.1660822742696;
        Thu, 18 Aug 2022 04:39:02 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id m24-20020ac24298000000b0048d1101d0d6sm190403lfh.121.2022.08.18.04.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 04:39:02 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 27IBcwRU028389;
	Thu, 18 Aug 2022 14:38:59 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 27IBcvXs028388;
	Thu, 18 Aug 2022 14:38:57 +0300
Date: Thu, 18 Aug 2022 14:38:57 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Scron Chang =?utf-8?B?KOW8teS7suW7tik=?= <Scron.Chang@quantatw.com>
Subject: Re: The entityID and entityInstance always be 0.1.
Message-ID: <Yv4k0WIuZ3Z5vdRq@home.paul.comp>
References: <HK0PR04MB25640ECCDEBE6D56436E8C1B869D9@HK0PR04MB2564.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK0PR04MB25640ECCDEBE6D56436E8C1B869D9@HK0PR04MB2564.apcprd04.prod.outlook.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, Feb 26, 2021 at 02:39:51AM +0000, Scron Chang (張仲延) wrote:
> In my case, the BMC uses intel-ipmi-oem, entity-manager, and dbus-sensors to manage the motherboard's sensors.
> I intend to retrieve entityID and entityInstance via IPMI command, e.g., ipmitool sensor get <sensor name>.
> However, intel-ipmi-oem always tries to find the sensor's "entityID" and "entityInstance" from its entity-manager entry. 
> (please refer to
> https://github.com/openbmc/intel-ipmi-oem/blob/09701efa93f2e9b25b19c4560db60c1878ef8a9c/include/sdrutils.hpp#L438 and
> https://github.com/openbmc/intel-ipmi-oem/blob/09701efa93f2e9b25b19c4560db60c1878ef8a9c/include/sdrutils.hpp#L470) 
> 
> It seems like the entity-manager should create these two attributes consumed by intel-ipmi-oem, but schema doesn't include them.
> Besides, entity-manager doesn't create "entityID" and "entityInstance" by itself.
> I'm curious how initially entity-manager or intel-ipmi-oem plans to implement this feature.

If you add the needed interface to your board json file EM will
automatically create it on D-Bus and intel-ipmi-oem will be able to
find it via the associations, e.g. add

        "xyz.openbmc_project.Inventory.Decorator.Ipmi": {
            "EntityId": 7,
            "EntityInstance": 1
        }

to the main Exposes section and you'll be able to observe it with

busctl introspect xyz.openbmc_project.EntityManager /xyz/openbmc_project/inventory/system/board/<your board>

If there exists /xyz/openbmc_project/inventory/system/board/<your board>/<sensorname>
then its first xyz.openbmc_project.Configuration.* interface is
checked and if it contains EntityId or EntityInstance that'll be
preferred. You can simply add them to a specific sensor's json
section, however this is going to work only if <sensorname> matches
exactly, so if more than one sensor is created from a single entry the
override won't happen (e.g. "C3_P12V_IOUT" won't use the value for
"C3_P12V").

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
