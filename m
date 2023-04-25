Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 440186EE66F
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 19:15:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5TD41Q6kz3cBq
	for <lists+openbmc@lfdr.de>; Wed, 26 Apr 2023 03:15:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20221208.gappssmtp.com header.i=@tanous-net.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=cq69Jvqj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20221208.gappssmtp.com header.i=@tanous-net.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=cq69Jvqj;
	dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5TCR2PZ3z3bh3
	for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2023 03:15:13 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-2f40b891420so5826608f8f.0
        for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2023 10:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20221208.gappssmtp.com; s=20221208; t=1682442904; x=1685034904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dW7KDplV0rV2nkNW6W/PZY61yU1PcHbPiec7RYche0o=;
        b=cq69Jvqj/W9Ji3wpf5AEVnaN6iOnqx96LSTzz704uYlDEupNnJTe/rrUWP13wSlk5A
         IWlPFq8V/iFEjkNetpfwX80itlAUGz11BaS1VakQzivEV+m3BWXIr5N8Yst8fUa0RHiU
         9GCUh4dSL9zgJMdu6VsJ3SjleNXrd2/Vr0nkbTURrF2nxbeubIqd++rguYz4Nxnu0kLV
         hfzTCskWuYNu+Ke7DjpD4AxDL1l9wqjLZ6D4YEYvGjTtKjftlNsY6bJWHmdwbSOJcvnQ
         CR9fXr67kBbTmafNkJVfgdeEDaWYM3UPtvErX2Cyinfzy2LnUo2O46uV/cog46Sb+kTg
         Rt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682442904; x=1685034904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dW7KDplV0rV2nkNW6W/PZY61yU1PcHbPiec7RYche0o=;
        b=iyYOvPY062G/nTGR35fjdvsxX80YF8+bkTpmI1mQsmf4A89Zh6r6dvwbuv05OL+cHS
         /qZ1UBZ81d7JfbYV1IZOQpH2kK6p3b2sCcOb14wVYbNzhFq9stRC7PHvHHIR7f7Efogd
         vOhEYFA5xwx0uzYCdlWSc67qtVrGergVrl9iqjSlLvwHtplRq9cDnePAXVMDp6ospVd3
         3zKbySLUBN65zo1qKfnreIX3sUeEv/DKcSWgW+kR37vr0Fa3Za6zeUvYpXcl3C4cM5i0
         gNmg6Mbm5p1B64yvP+cq8JHGa121T3Tl7tjsxWdC89VUTRBZe8Tx6F3DZPqFpRHnFmHR
         6RBA==
X-Gm-Message-State: AAQBX9e1UmHZL7pLzEb154n2cO/IGci8ST2kNJhi2vJxpw43Qh/bPdJ4
	ad+X2Mg9ehJAsZKJIzDUE5RqCYqLJ1nRByOLE+k60w==
X-Google-Smtp-Source: AKy350ZKWqfZR3twqyyidbQ0FUGPWyoMX6vd836t10TXBcabEXy3MqioE1evIiYcXF6o52yAj8F2Ona7We4uyE50Z2c=
X-Received: by 2002:adf:f710:0:b0:2dc:cb11:bed3 with SMTP id
 r16-20020adff710000000b002dccb11bed3mr11982843wrp.68.1682442903801; Tue, 25
 Apr 2023 10:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <CY5PR12MB6083E003B72438968F80D7D0CC609@CY5PR12MB6083.namprd12.prod.outlook.com>
In-Reply-To: <CY5PR12MB6083E003B72438968F80D7D0CC609@CY5PR12MB6083.namprd12.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 25 Apr 2023 10:14:50 -0700
Message-ID: <CACWQX80NqAe0QXzx73TtsravWS2uabDdaYw2xwOBfKS90Gw6ag@mail.gmail.com>
Subject: Re: $expand on sensors slower than individual gets
To: Aishwary Joshi <aishwaryj@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Apr 21, 2023 at 2:23=E2=80=AFAM Aishwary Joshi <aishwaryj@nvidia.co=
m> wrote:
>
> Hi All,
>
>
>
> We would like to get feedback on following performance issue that we have=
 observed with $expand on /redfish/v1/Chassis/<ChassisId>/Sensors URI compa=
red to using GET on individual Sensor URI (/redfish/v1/Chassis/<ChassisId>/=
Sensors/<SensorName>) on some Chassis
>
>
>
> Little bit background about the system:
>
> 1. No of Sensors present on the Chassis_X(where we see performance drop w=
ith $expand) : 7 sensors
>
> 2. No of Sensors present on the Chassis_Y(where we DONOT see the performa=
nce drop $expand): 31 sensors
>
> 3. We have a common service that host 24 Chassis (including Chassis_X, Ch=
assis_Y)
>
> 4. Total No of Sensors supported by service that host 24 Chassis instance=
s: 102
>
> 5. Time it took with $expand on Chassis_X sensors: 0.48secs('/redfish/v1/=
Chassis/Chassis_X/Sensors?$expand=3D*($levels=3D1)')
>
> 6. Total time taken by querying 7 sensors(present on Chassis_X) URI: 0.6s=
ecs
>
> 6. Time it took with $expand on Chassis_Y sensors: 0.48secs('/redfish/v1/=
Chassis/Chassis_X/Sensors?$expand=3D*($levels=3D1)')
>
> 7. Total time taken by querying 31 sensors(present on Chassis_y) URI: 0.9=
1secs
>
>
>
> We see advantage of using $expand on Chassis_Y but not on Chassis_X.
>
> And Based on our analysis on $expand, looks like performance of $expand o=
n sensors is tied to the number of sensors hosted by backend service and no=
t by the number of sensors present on a Chassis. This is because of "GetMan=
agedObjects" call done on the backend service which returns 102 sensors in =
our case irrespective of the number of sensors present on the requested cha=
ssis.
>
> Code Ref: https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/=
sensors.hpp#L2471
>
>
>
> Because of this issue problem, we are noticing significant perf drop when=
 using $expand
>
> 8. Total time to query individual Sensors URI(101) : 3.08secs
>
> 9. Total time to query sensors with $expand(24 URIs) : 12secs

Could you please try to bisect this down to the commit that caused the
regression?  928fefb9a542b816d7c0418077def2b3874d1b0f might be of
note, because I think that's the one that did the GetManagedObjects?

>
>
>
>
>
>
>
> We would like to know
>
> 1. Is this the correct current behaviour with bmcweb.

Obviously anything that provides worse performance is not ideal, and
should be looked into, but in terms of correctness, it sounds like
it's giving the correct responses in both cases, so it sounds like
it's not a bug, but a performance regression.

>
> 2. if community is also experiencing similar performance drop with case m=
entioned above and what has been done to resolve it ?
>
> Also like to know if any recent $expand enhancement done in the sensor ar=
ea which might help with performance issue, please do let me know.

see the SHA1 above.


My suspicion is that we either need to:
1. Roll back the efficient expand patches until they don't cause a
performance regression.
2. Determine the crossover of how many sensors for which
GetManagedObjects is faster than GetAll, and have bmcweb pick between
the two paths dependent on how many sensors are there.
