Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AC4CB29F
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 02:04:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kqqb08lMzDqXv
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 10:04:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mwZNWI4f"; 
 dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kqpw6mmvzDqXl
 for <openbmc@lists.ozlabs.org>; Fri,  4 Oct 2019 10:03:52 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id x10so2705791pgi.5
 for <openbmc@lists.ozlabs.org>; Thu, 03 Oct 2019 17:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Guk7S0vDWFd9DtCsL1+eOjr7KPe+Bx/aqjOvHdPJlXw=;
 b=mwZNWI4fyBwPcRIpwjo/OC3b21t9sKq8KowMNkIhktbJrQnJCdaXC/+YDWT5C5ZeML
 F1f0MAe4zN9zP+ICgJIDw4PyN3fEBZYcFUT8ZjeLHUAOz/NmPBCPrJfzdxyCIFArQAyL
 njAuFMzqB3jMIGh1q9PvquNx1v7rQbRNWujIM9hwAAlMyKCLWjJBTtsjqJfs7snlYw3c
 bBmeRcYx4AFITUZHXraCYPx5OloClABQWOyuysnCXlsblH1upvpRT+QsnTWnoM6mV5pG
 mauELn1sw0lf7X46r0I2ZErOUcAiOSKwaVk6UNdi7ywZRkTY/tibfPWo62o52KjP6hiE
 QebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Guk7S0vDWFd9DtCsL1+eOjr7KPe+Bx/aqjOvHdPJlXw=;
 b=kXoeRleiQK4gBNcxXEmvHmemRhWvcnyM9npitcn0IjlBjdcQjpVUkKdA2bYFNezZw8
 OUZTLt3U5u5XT/ksysOCFeE05JZqPu5JORTjtQWufgrjOq4iomufnJt4OGJJeIt5bWNh
 BYVZku3sme/DjJqUxObjBGl1X+b1hSOTWHORxWFiOyPFd+H+9x8ovgsCA30/CrvuMXpL
 FZ59X4X0fm1GQgek61Y3mpVd+sgXGQvOaNEVeQm2nkDbHMvBVD6QCiPDPhmjb/Le6hVb
 wVcADpKThOqmu+TYdBFdMkcGqzNtCIqxuQDHJoa3TtY2cmxCiBg3sgRmSaJIHP1ck1oc
 aYlQ==
X-Gm-Message-State: APjAAAXZZ2BlYsCDBfPrHEWmgWSiS5HFeCxARwdYjIgDr2jgpwhV9wbB
 gYZXEB7y1/LkQcKTym+qycJq5/iNVgCmVASap7Iz2g==
X-Google-Smtp-Source: APXvYqyhWbu31uzLpWp8HsGu/pgnxgtbVT+gGJc/fCcKJc7q4t9k9Y/LI6me5Yq4PuQFiuykS2sNTztGNtmSuG6XCmU=
X-Received: by 2002:a17:90a:be13:: with SMTP id
 a19mr12950820pjs.55.1570147428462; 
 Thu, 03 Oct 2019 17:03:48 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 3 Oct 2019 17:03:37 -0700
Message-ID: <CAO=notzNuQDWtXG9CCLd9qEvqhcsDa2V=6a4KogjkwCC2RZtwA@mail.gmail.com>
Subject: Gain,Offset with dbus-sensors values
To: James Feist <james.feist@linux.intel.com>, Josh Lehan <krellan@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

James;

We have some sensors that need a gain and offset value set in the json
file, for PSU sensors, but only vout/vin or some specific ones, and
not applied to all sensors.

Akin to: https://github.com/openbmc/phosphor-hwmon/blob/2227bd52c5bb8d62dcfe33b58d65515d21e9be17/sensor.cpp#L59

Also, is there a way to customize the very verbose suffixes PSUsensor applies
such as "Temperature" and "Output_Power".  With IPMI we're only
granted 16 characters for the name and ipmid uses the last part of the
dbus path for the name.

Perhaps ipmid should allow overriding the name value.

Patrick
