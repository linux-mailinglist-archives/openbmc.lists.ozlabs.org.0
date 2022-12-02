Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D25B9640D81
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 19:39:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NP1tb3s3mz3bfy
	for <lists+openbmc@lfdr.de>; Sat,  3 Dec 2022 05:39:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iPHaTahL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=argataullina@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iPHaTahL;
	dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NP1sz2vx1z3bN8
	for <openbmc@lists.ozlabs.org>; Sat,  3 Dec 2022 05:38:30 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id g12so8692961lfh.3
        for <openbmc@lists.ozlabs.org>; Fri, 02 Dec 2022 10:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dXnzczsiq3bPLTUULrAlCyZ2hKJbFg+Nf3y1ogFbxK0=;
        b=iPHaTahLfTepu2O3Ku9G92CGQ9yYa2NmNphmW0xrn8VKwYlf7aMfqnkqkYUdrWjLCv
         2/mrdIHTHkzYXt+01EEY1b7mkv1QPS/cnaswq34BF5Vj35xRuFSYaZwip3iWQaTx2X/x
         yv3HmVzlH6Radl+blwIGl0x/njPSqjCHTbMl+z1ExKceZDzlLT9CpcKzJvkxPv/YqejY
         33zaiPzUq0uYXpE2/H4LLn5fYFWH9xSDqOGDvAR+VRLCWPXeMkml+MJTbsOUUAHAI22b
         33BJqnZsZvbl68KDZP+jG3DgvUzmYl2m0fDNdFAN2P8N+uN3FT2mcDYL8NdpQ8I9kWyx
         AWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dXnzczsiq3bPLTUULrAlCyZ2hKJbFg+Nf3y1ogFbxK0=;
        b=lP/pZOzMtCjWyLa7bTZOJ3JFLzz2Frn3cSyWwrjaApDaaOTjXpZatFuxQgt+7l/IYP
         VdPOHkA2eGbu4SwBQY5Y3zqir6VPYJ6UuQB7cRZl9LwTNH9UwLVrj7efTpK8gwu8itU9
         bnGOOOwBkojDgJLZeMftY2G4iiNk5xl9Dtdgcsh/ndsoORCxusQiFOESlPG3xk8fnP/3
         Czg2aufTRUoDBtNQzHr5kGCGYtpG3qimn5iH9jkFzMHMC98RL1nPFQwTjuP7OEgAF4qD
         KKoXbj/lSuHLxInhr7FPim3AuapAqyeS/GcXis+II6+XZUWDEA9Hvu6MxPONCao9AT8n
         f8Fg==
X-Gm-Message-State: ANoB5pnD564AS7G/YvUBMmiSjPcUqon9sSQysuecllYfMRhkWO3ZUYnT
	BuXtzdpOYXw1oWIXBs3Ujb0=
X-Google-Smtp-Source: AA0mqf6Ol2gpwA3f4ZfxhNAsKftIdyY2/j/Rs8hEP29hw6l7yt2zNVu+A1XVuNDjYDjSUCqbX8chuQ==
X-Received: by 2002:ac2:4c4a:0:b0:4aa:1e21:8f1f with SMTP id o10-20020ac24c4a000000b004aa1e218f1fmr18124919lfk.651.1670006303243;
        Fri, 02 Dec 2022 10:38:23 -0800 (PST)
Received: from [192.168.0.104] ([85.202.228.74])
        by smtp.gmail.com with ESMTPSA id l12-20020a056512110c00b0047f7722b73csm1090527lfg.142.2022.12.02.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:38:22 -0800 (PST)
Message-ID: <2cf8fd4925cd441b1f131497450486d3ed113e27.camel@gmail.com>
Subject: Re: [OpenBmc][JournalD] Persisting Journal Logs
From: Alisa Gataullina <argataullina@gmail.com>
To: Rohit Pai <ropai@nvidia.com>
Date: Fri, 02 Dec 2022 21:38:22 +0300
In-Reply-To: <LV2PR12MB6014244EC8301F492BB8BF84CD149@LV2PR12MB6014.namprd12.prod.outlook.com>
References: 	<LV2PR12MB6014244EC8301F492BB8BF84CD149@LV2PR12MB6014.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
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

On Thu, 2022-12-01 at 14:04 +0000, Rohit Pai wrote:
> I am running open bmc with Linux 5.15 and systemd 251 (251.2+).
> I have configured persistent logging for journal.
> /etc/systemd/journald.conf
> [Journal]
> Storage=3Dpersistent
> =C2=A0
> Created folder /var/log/journal. This is mounted on mtd flash
> partition.
> The rootfs has overlay with RO filesystem and RW filesystem coming
> from mtd partition.
> =C2=A0
> ls -alt /var/log/journal/
> drwxr-sr-x=C2=A0=C2=A0=C2=A0 2 root=C2=A0=C2=A0=C2=A0=C2=A0 systemd-=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 Jan=C2=A0 1 00:03
> 2b4305f670484d1fa6b9c4deee336b91
> =C2=A0
> Jouranld creates a folder under /var/log/journal but I dont see
> anything getting stored here ever.=C2=A0
> I don't see journal being persistent across reboots.
> Journal logs are kept only in /run/log/journal, and this is tmpfs in
> the system and gets erased on each reboot.
> I have tried=C2=A0journalctl --flush=C2=A0to see if anything gets pushed =
to
> inside /var/log/journal but nothing is stored apart from the folder
> name.=C2=A0
> journalctl --rotate=C2=A0also has no impact.
> I seem to be doing everything as per the journalctl documentation but
> still it=E2=80=99s not working.
> =C2=A0
> Anyone else has seen this issue, any help?
> =C2=A0
> Thanks=20
> Rohit PAI=20

Hello

To change journal log directory:

systemd-tmpfiles --create --prefix /var/log/journal
systemctl restart systemd-journald

It needs to check journal log rotate settings. But this isn't
recommended way for embedded system- too many rewriting cycles. The
best way is to use remote syslog

To mount /var/log on persistent storage with yocto you could add =20
VOLATILE_LOG_DIR =3D "no"  into conf file of machine.
After that all RedFsh, IPMI and all others logs defined with
rsyslog.conf will be there on persistent storage. Also yocto created
directory /var/log/journal but journal use default log path
/run/log/journal. And you need to setup it.

Best Regards,
Alisa
