Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B76D0747355
	for <lists+openbmc@lfdr.de>; Tue,  4 Jul 2023 15:53:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=SoKFHTV+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwPQG4ZRvz3bYm
	for <lists+openbmc@lfdr.de>; Tue,  4 Jul 2023 23:53:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=SoKFHTV+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwPPj3CTHz30Kd
	for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2023 23:52:56 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b6ef64342aso23281711fa.3
        for <openbmc@lists.ozlabs.org>; Tue, 04 Jul 2023 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688478768; x=1691070768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwHicCTMp9IxVBxeOmpAXkikJ9Q63C5x2H39KT9T4EA=;
        b=SoKFHTV+uf96Npj1a68B5fUt5AfL2jbR6JqHgY022axhyGb7VoNpRmtYL6vqhdyNe6
         1Nwm4WXzw7WYp8JkD+vaJ3tgTV6JIH2U6a69W7T4Ufmn0bfpUQED+T9oiuhU+gD7KmIu
         aMqsTL8nVKeGofy2C0bYY5f+jVmIZ99NGMqkcBA/bgdet6OiptkF7TS71nJnV9ScReqI
         iWs37lUTawM67MeIXdKLmQlFsYFhTXQohI5a2KZA8Jxajaf74bd2Yk2kzkSAK7GAgoI+
         Gb8jKzabpLzf28B/BNhsMRD+w0dsWctpDNscRzkC8+JyUMAAhv99Kojwp72Agskk42/u
         7pYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688478768; x=1691070768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwHicCTMp9IxVBxeOmpAXkikJ9Q63C5x2H39KT9T4EA=;
        b=Zn2LENPJcoGqtaYeFif8hnRLN+WQMQdrzk9rvmrwMqttEVXWbPXX8wqms41mRKjeVu
         qdyTMsq+5AxisiVYLPg4Blb4T7BwwYjXo8B2ywixC/kAo+rGSOI1WMK1SEsM64IgHZWe
         e0GmXBcQba3aYOYpABnjavU26rgsBbZlRwMkIjuwU+aMmYHk35LGAy4GuPZxO9dRa3KU
         4Ihyd+I08bV6+0vhC0x2Jh+DQf2w2VrWDs/8mOza/lyoYs4i+Ql7iDQFAkFlOqpnAxSU
         m/486L+nu6w6AtU+Sp+9/Ye5F1hqrrUvh2LVxfi4HUZVwQOJWc3e8G0sh5lAjORhRybr
         EGQA==
X-Gm-Message-State: ABy/qLZGCzRm0qrq519YkmICjy5glgz8vKS23pBl+GvNho+U/0lUMl+s
	AN12EoA9lhcC4EnuyEFt0iw=
X-Google-Smtp-Source: APBJJlHoWBVPy5xfUJwA1wjDVUeYUtaBDUp/n7zedmbyUsWXMoAD2cZlZLDtOSRgnusLCdH5Q63wRw==
X-Received: by 2002:a2e:9c4e:0:b0:2b6:ece0:a3c1 with SMTP id t14-20020a2e9c4e000000b002b6ece0a3c1mr3469116ljj.35.1688478767568;
        Tue, 04 Jul 2023 06:52:47 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id f18-20020a2e9192000000b002b6f8d07d30sm334970ljg.134.2023.07.04.06.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 06:52:47 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 364DqhZt029361;
	Tue, 4 Jul 2023 16:52:44 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 364DqgU3029360;
	Tue, 4 Jul 2023 16:52:42 +0300
Date: Tue, 4 Jul 2023 16:52:42 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Nikita Pavlov <niikita@yahoo.com>
Subject: Re: problem with displayed peci temperature sensors in webui
Message-ID: <ZKQkKlumHnVktCs2@home.paul.comp>
References: <800107506.2442690.1658745278973.ref@mail.yahoo.com>
 <800107506.2442690.1658745278973@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <800107506.2442690.1658745278973@mail.yahoo.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Nikita,

On Mon, Jul 25, 2022 at 10:34:38AM +0000, Nikita Pavlov wrote:
> Also I have peci sensors. Hwmon read peci files and set values on dbus.

What daemon exposes PECI sensors on D-Bus for you? What Linux version
are you using?

With current OpenBMC you either need omnisensor or this patch to
dbus-sensors https://gerrit.openbmc.org/c/openbmc/dbus-sensors/+/62025
to get them visible.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
