#====================================================================
# Name   : buildings.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Unification for ALL slabs and stairs
#====================================================================

#priority 0

//Classのimport
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeAction;
import crafttweaker.recipes.IRecipeFunction;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.HexHelper;
import mods.zenutils.I18n;
import scripts.grassUtils.RecipeUtils;
import scripts.HiiragiUtils;

//読み込みの開始をログに出力
print("Start loading buildings.zs ...");

//Slabのレシピを抜本的に改変
	val mapSlabs as IItemStack[IItemStack] = {
		<minecraft:stone_slab:0>: <minecraft:stone:0>,
		<minecraft:stone_slab:1>: <minecraft:sandstone:0>,
		<minecraft:stone_slab:3>: <minecraft:cobblestone>,
		<minecraft:stone_slab:4>: <minecraft:brick_block>,
		<minecraft:stone_slab:5>: <minecraft:stonebrick:0>,
		<minecraft:stone_slab:6>: <minecraft:nether_brick>,
		<minecraft:stone_slab:7>: <minecraft:quartz_block:0>,
		<minecraft:wooden_slab:0>: <minecraft:planks:0>,
		<minecraft:wooden_slab:1>: <minecraft:planks:1>,
		<minecraft:wooden_slab:2>: <minecraft:planks:2>,
		<minecraft:wooden_slab:3>: <minecraft:planks:3>,
		<minecraft:wooden_slab:4>: <minecraft:planks:4>,
		<minecraft:wooden_slab:5>: <minecraft:planks:5>,
		<minecraft:stone_slab2:0>: <minecraft:red_sandstone:0>,
		<minecraft:purpur_slab>: <minecraft:purpur_block>,
		<appliedenergistics2:sky_stone_slab>: <appliedenergistics2:sky_stone_block>,
		<appliedenergistics2:smooth_sky_stone_slab>: <appliedenergistics2:smooth_sky_stone_block>,
		<appliedenergistics2:sky_stone_brick_slab>: <appliedenergistics2:sky_stone_brick>,
		<appliedenergistics2:sky_stone_small_brick_slab>: <appliedenergistics2:sky_stone_small_brick>,
		<appliedenergistics2:fluix_slab>: <appliedenergistics2:fluix_block>,
		<appliedenergistics2:quartz_slab>: <appliedenergistics2:quartz_block>,
		<appliedenergistics2:chiseled_quartz_slab>: <appliedenergistics2:chiseled_quartz_block>,
		<appliedenergistics2:quartz_pillar_slab>: <appliedenergistics2:quartz_pillar>,
		<astralsorcery:blockmarbleslab>: <astralsorcery:blockmarble:1>,
		<biomesoplenty:other_slab>: <biomesoplenty:mud_brick_block>,
		<biomesoplenty:other_slab:1>: <biomesoplenty:white_sandstone>,
		<biomesoplenty:wood_slab_0:0>: <biomesoplenty:planks_0:0>,
		<biomesoplenty:wood_slab_0:1>: <biomesoplenty:planks_0:1>,
		<biomesoplenty:wood_slab_0:2>: <biomesoplenty:planks_0:2>,
		<biomesoplenty:wood_slab_0:3>: <biomesoplenty:planks_0:3>,
		<biomesoplenty:wood_slab_0:4>: <biomesoplenty:planks_0:4>,
		<biomesoplenty:wood_slab_0:5>: <biomesoplenty:planks_0:5>,
		<biomesoplenty:wood_slab_0:6>: <biomesoplenty:planks_0:6>,
		<biomesoplenty:wood_slab_0:7>: <biomesoplenty:planks_0:7>,
		<biomesoplenty:wood_slab_1:0>: <biomesoplenty:planks_0:8>,
		<biomesoplenty:wood_slab_1:1>: <biomesoplenty:planks_0:9>,
		<biomesoplenty:wood_slab_1:2>: <biomesoplenty:planks_0:10>,
		<biomesoplenty:wood_slab_1:3>: <biomesoplenty:planks_0:11>,
		<biomesoplenty:wood_slab_1:4>: <biomesoplenty:planks_0:12>,
		<biomesoplenty:wood_slab_1:5>: <biomesoplenty:planks_0:13>,
		<biomesoplenty:wood_slab_1:6>: <biomesoplenty:planks_0:14>,
		<biomesoplenty:wood_slab_1:7>: <biomesoplenty:planks_0:15>,
		<botania:livingwood0slab>: <botania:livingwood:0>,
		<botania:livingwood1slab>: <botania:livingwood:1>,
		<botania:livingrock0slab>: <botania:livingrock:0>,
		<botania:livingrock1slab>: <botania:livingrock:1>,
		<botania:dreamwood0slab>: <botania:dreamwood:0>,
		<botania:dreamwood1slab>: <botania:dreamwood:1>,
		<botania:quartzslabdarkhalf>: <botania:quartztypedark>,
		<botania:quartzslabmanahalf>: <botania:quartztypemana>,
		<botania:quartzslabblazehalf>: <botania:quartztypeblaze>,
		<botania:quartzslablavenderhalf>: <botania:quartztypelavender>,
		<botania:quartzslabredhalf>: <botania:quartztypered>,
		<botania:quartzslabelfhalf>: <botania:quartztypeelf>,
		<botania:quartzslabsunnyhalf>: <botania:quartztypesunny>,
		<botania:biomestonea0slab>: <botania:biomestonea:0>,
		<botania:biomestonea1slab>: <botania:biomestonea:1>,
		<botania:biomestonea2slab>: <botania:biomestonea:2>,
		<botania:biomestonea3slab>: <botania:biomestonea:3>,
		<botania:biomestonea4slab>: <botania:biomestonea:4>,
		<botania:biomestonea5slab>: <botania:biomestonea:5>,
		<botania:biomestonea6slab>: <botania:biomestonea:6>,
		<botania:biomestonea7slab>: <botania:biomestonea:7>,
		<botania:biomestonea8slab>: <botania:biomestonea:8>,
		<botania:biomestonea9slab>: <botania:biomestonea:9>,
		<botania:biomestonea10slab>: <botania:biomestonea:10>,
		<botania:biomestonea11slab>: <botania:biomestonea:11>,
		<botania:biomestonea12slab>: <botania:biomestonea:12>,
		<botania:biomestonea13slab>: <botania:biomestonea:13>,
		<botania:biomestonea14slab>: <botania:biomestonea:14>,
		<botania:biomestonea15slab>: <botania:biomestonea:15>,
		<botania:biomestoneb0slab>: <botania:biomestoneb:0>,
		<botania:biomestoneb1slab>: <botania:biomestoneb:1>,
		<botania:biomestoneb2slab>: <botania:biomestoneb:2>,
		<botania:biomestoneb3slab>: <botania:biomestoneb:3>,
		<botania:biomestoneb4slab>: <botania:biomestoneb:4>,
		<botania:biomestoneb5slab>: <botania:biomestoneb:5>,
		<botania:biomestoneb6slab>: <botania:biomestoneb:6>,
		<botania:biomestoneb7slab>: <botania:biomestoneb:7>,
		<botania:pavement0slab>: <botania:pavement:0>,
		<botania:pavement1slab>: <botania:pavement:1>,
		<botania:pavement2slab>: <botania:pavement:2>,
		<botania:pavement3slab>: <botania:pavement:3>,
		<botania:pavement4slab>: <botania:pavement:4>,
		<botania:pavement5slab>: <botania:pavement:5>,
		<botania:shimmerrock0slab>: <botania:shimmerrock>,
		<botania:shimmerwoodplanks0slab>: <botania:shimmerwoodplanks>,
		<dcs_climate:dcs_build_slab:0>: <dcs_climate:dcs_ore_gemblock:3>,
		<dcs_climate:dcs_build_slab:1>: <dcs_climate:dcs_build_selenite>,
		<dcs_climate:dcs_build_slab:2>: <dcs_climate:dcs_ore_gemblock:6>,
		<dcs_climate:dcs_build_slab:3>: <dcs_climate:dcs_ore_gemblock:9>,
		<dcs_climate:dcs_build_slab:4>: <dcs_climate:dcs_ore_gemblock:12>,
		<dcs_climate:dcs_build_slab:5>: <dcs_climate:dcs_build_build:7>,
		<dcs_climate:dcs_build_slab:6>: <dcs_climate:dcs_layer_skarn>,
		<dcs_climate:dcs_build_slab:7>: <dcs_climate:dcs_layer_skarn:2>,
		<dcs_climate:dcs_build_slab_chal:0>: <dcs_climate:dcs_ore_gemblock:0>,
		<dcs_climate:dcs_build_slab_chal:1>: <dcs_climate:dcs_ore_gemblock:1>,
		<dcs_climate:dcs_build_slab_chal:2>: <dcs_climate:dcs_ore_gemblock:2>,
		<dcs_climate:dcs_build_slab_chal:3>: <dcs_climate:dcs_build_challamp:0>,
		<dcs_climate:dcs_build_slab_chal:4>: <dcs_climate:dcs_build_challamp:1>,
		<dcs_climate:dcs_build_slab_chal:5>: <dcs_climate:dcs_build_challamp:2>,
		<dcs_climate:dcs_build_slab_chal:6>: <dcs_climate:dcs_build_challamp:3>,
		<railcraft:creosote_slab>: <railcraft:creosote_block>,
		//<railcraft:abyssal_slab:0>: <railcraft:abyssal:1>,
		//<railcraft:abyssal_slab:1>: <railcraft:abyssal:0>,
		<railcraft:badlands_slab:0>: <railcraft:badlands:1>,
		<railcraft:badlands_slab:1>: <railcraft:badlands:0>,
		<railcraft:bleachedbone_slab:0>: <railcraft:bleachedbone:1>,
		<railcraft:bleachedbone_slab:1>: <railcraft:bleachedbone:0>,
		<railcraft:bloodstained_slab:0>: <railcraft:bloodstained:1>,
		<railcraft:bloodstained_slab:1>: <railcraft:bloodstained:0>,
		<railcraft:frostbound_slab:0>: <railcraft:frostbound:1>,
		<railcraft:frostbound_slab:1>: <railcraft:frostbound:0>,
		<railcraft:infernal_slab:0>: <railcraft:infernal:1>,
		<railcraft:infernal_slab:1>: <railcraft:infernal:0>,
		<railcraft:pearlized_slab:0>: <railcraft:pearlized:1>,
		<railcraft:pearlized_slab:1>: <railcraft:pearlized:0>,
		//<railcraft:quarried_slab:0>: <railcraft:quarried:1>,
		//<railcraft:quarried_slab:1>: <railcraft:quarried:0>,
		<railcraft:sandy_slab:0>: <railcraft:sandy:1>,
		<railcraft:sandy_slab:1>: <railcraft:sandy:0>,
		<twilightforest:aurora_slab>: <twilightforest:aurora_block>,
		<twilightforest:twilight_oak_slab>: <twilightforest:twilight_oak_planks:0>,
		<twilightforest:canopy_slab>: <twilightforest:canopy_planks:0>,
		<twilightforest:mangrove_slab>: <twilightforest:mangrove_planks:0>,
		<twilightforest:dark_slab>: <twilightforest:dark_planks:0>,
		<twilightforest:time_slab>: <twilightforest:time_planks:0>,
		<twilightforest:trans_slab>: <twilightforest:trans_planks:0>,
		<twilightforest:mine_slab>: <twilightforest:mine_planks:0>,
		<twilightforest:sort_slab>: <twilightforest:sort_planks:0>,
		<tconstruct:deco_ground_slab>: <tconstruct:deco_ground>,
		<tconstruct:firewood_slab:0>: <tconstruct:firewood:0>,
		<tconstruct:firewood_slab:1>: <tconstruct:firewood:1>,
		<tconstruct:seared_slab:0>: <tconstruct:seared:0>,
		<tconstruct:seared_slab:1>: <tconstruct:seared:1>,
		<tconstruct:seared_slab:2>: <tconstruct:seared:2>,
		<tconstruct:seared_slab:3>: <tconstruct:seared:3>,
		<tconstruct:seared_slab:4>: <tconstruct:seared:4>,
		<tconstruct:seared_slab:5>: <tconstruct:seared:5>,
		<tconstruct:seared_slab:6>: <tconstruct:seared:6>,
		<tconstruct:seared_slab:7>: <tconstruct:seared:7>,
		<tconstruct:seared_slab2:0>: <tconstruct:seared:8>,
		<tconstruct:seared_slab2:1>: <tconstruct:seared:9>,
		<tconstruct:seared_slab2:2>: <tconstruct:seared:10>,
		<tconstruct:seared_slab2:3>: <tconstruct:seared:11>,
		<tconstruct:dried_clay_slab:0>: <tconstruct:dried_clay:0>,
		<tconstruct:dried_clay_slab:1>: <tconstruct:dried_clay:1>,
		<tconstruct:brownstone_slab:0>: <tconstruct:brownstone:0>,
		<tconstruct:brownstone_slab:1>: <tconstruct:brownstone:1>,
		<tconstruct:brownstone_slab:2>: <tconstruct:brownstone:2>,
		<tconstruct:brownstone_slab:3>: <tconstruct:brownstone:3>,
		<tconstruct:brownstone_slab:4>: <tconstruct:brownstone:4>,
		<tconstruct:brownstone_slab:5>: <tconstruct:brownstone:5>,
		<tconstruct:brownstone_slab:6>: <tconstruct:brownstone:6>,
		<tconstruct:brownstone_slab:7>: <tconstruct:brownstone:7>,
		<tconstruct:brownstone_slab2:0>: <tconstruct:brownstone:8>,
		<tconstruct:brownstone_slab2:1>: <tconstruct:brownstone:9>,
		<tconstruct:brownstone_slab2:2>: <tconstruct:brownstone:10>,
		<tconstruct:brownstone_slab2:3>: <tconstruct:brownstone:11>,
	};
	for slab, full in mapSlabs {
		recipes.remove(slab);
		HiiragiUtils.addShaped(slab*2, [[full, ToolSaw]], null, null);
		HiiragiUtils.addShapeless(full, [slab, slab], null, null);
		}

//Stairのレシピを抜本的に改変
	val mapStair as IItemStack[IItemStack] = {
		//<minecraft:stone_slab:0>: <minecraft:stone:0>,
		<minecraft:sandstone_stairs>: <minecraft:sandstone:0>,
		<minecraft:stone_stairs>: <minecraft:cobblestone>,
		<minecraft:brick_stairs>: <minecraft:brick_block>,
		<minecraft:stone_brick_stairs>: <minecraft:stonebrick:0>,
		<minecraft:nether_brick_stairs>: <minecraft:nether_brick>,
		<minecraft:quartz_stairs>: <minecraft:quartz_block:0>,
		<minecraft:oak_stairs>: <minecraft:planks:0>,
		<minecraft:spruce_stairs>: <minecraft:planks:1>,
		<minecraft:birch_stairs>: <minecraft:planks:2>,
		<minecraft:jungle_stairs>: <minecraft:planks:3>,
		<minecraft:acacia_stairs>: <minecraft:planks:4>,
		<minecraft:dark_oak_stairs>: <minecraft:planks:5>,
		<minecraft:red_sandstone_stairs>: <minecraft:red_sandstone:0>,
		<minecraft:purpur_stairs>: <minecraft:purpur_block>,
		<appliedenergistics2:sky_stone_stairs>: <appliedenergistics2:sky_stone_block>,
		<appliedenergistics2:smooth_sky_stone_stairs>: <appliedenergistics2:smooth_sky_stone_block>,
		<appliedenergistics2:sky_stone_brick_stairs>: <appliedenergistics2:sky_stone_brick>,
		<appliedenergistics2:sky_stone_small_brick_stairs>: <appliedenergistics2:sky_stone_small_brick>,
		<appliedenergistics2:fluix_stairs>: <appliedenergistics2:fluix_block>,
		<appliedenergistics2:quartz_stairs>: <appliedenergistics2:quartz_block>,
		<appliedenergistics2:chiseled_quartz_stairs>: <appliedenergistics2:chiseled_quartz_block>,
		<appliedenergistics2:quartz_pillar_stairs>: <appliedenergistics2:quartz_pillar>,
		<astralsorcery:blockmarblestairs>: <astralsorcery:blockmarble:1>,
		<biomesoplenty:mud_brick_stairs>: <biomesoplenty:mud_brick_block>,
		<biomesoplenty:white_sandstone_stairs>: <biomesoplenty:white_sandstone>,
		<biomesoplenty:sacred_oak_stairs>: <biomesoplenty:planks_0:0>,
		<biomesoplenty:cherry_stairs>: <biomesoplenty:planks_0:1>,
		<biomesoplenty:umbran_stairs>: <biomesoplenty:planks_0:2>,
		<biomesoplenty:fir_stairs>: <biomesoplenty:planks_0:3>,
		<biomesoplenty:ethereal_stairs>: <biomesoplenty:planks_0:4>,
		<biomesoplenty:magic_stairs>: <biomesoplenty:planks_0:5>,
		<biomesoplenty:mangrove_stairs>: <biomesoplenty:planks_0:6>,
		<biomesoplenty:palm_stairs>: <biomesoplenty:planks_0:7>,
		<biomesoplenty:redwood_stairs>: <biomesoplenty:planks_0:8>,
		<biomesoplenty:willow_stairs>: <biomesoplenty:planks_0:9>,
		<biomesoplenty:pine_stairs>: <biomesoplenty:planks_0:10>,
		<biomesoplenty:hellbark_stairs>: <biomesoplenty:planks_0:11>,
		<biomesoplenty:jacaranda_stairs>: <biomesoplenty:planks_0:12>,
		<biomesoplenty:mahogany_stairs>: <biomesoplenty:planks_0:13>,
		<biomesoplenty:ebony_stairs>: <biomesoplenty:planks_0:14>,
		<biomesoplenty:eucalyptus_stairs>: <biomesoplenty:planks_0:15>,
		<botania:livingwood0stairs>: <botania:livingwood:0>,
		<botania:livingwood1stairs>: <botania:livingwood:1>,
		<botania:livingrock0stairs>: <botania:livingrock:0>,
		<botania:livingrock1stairs>: <botania:livingrock:1>,
		<botania:dreamwood0stairs>: <botania:dreamwood:0>,
		<botania:dreamwood1stairs>: <botania:dreamwood:1>,
		<botania:quartzstairsdark>: <botania:quartztypedark>,
		<botania:quartzstairsmana>: <botania:quartztypemana>,
		<botania:quartzstairsblaze>: <botania:quartztypeblaze>,
		<botania:quartzstairslavender>: <botania:quartztypelavender>,
		<botania:quartzstairsred>: <botania:quartztypered>,
		<botania:quartzstairself>: <botania:quartztypeelf>,
		<botania:quartzstairssunny>: <botania:quartztypesunny>,
		<botania:biomestonea0stairs>: <botania:biomestonea:0>,
		<botania:biomestonea1stairs>: <botania:biomestonea:1>,
		<botania:biomestonea2stairs>: <botania:biomestonea:2>,
		<botania:biomestonea3stairs>: <botania:biomestonea:3>,
		<botania:biomestonea4stairs>: <botania:biomestonea:4>,
		<botania:biomestonea5stairs>: <botania:biomestonea:5>,
		<botania:biomestonea6stairs>: <botania:biomestonea:6>,
		<botania:biomestonea7stairs>: <botania:biomestonea:7>,
		<botania:biomestonea8stairs>: <botania:biomestonea:8>,
		<botania:biomestonea9stairs>: <botania:biomestonea:9>,
		<botania:biomestonea10stairs>: <botania:biomestonea:10>,
		<botania:biomestonea11stairs>: <botania:biomestonea:11>,
		<botania:biomestonea12stairs>: <botania:biomestonea:12>,
		<botania:biomestonea13stairs>: <botania:biomestonea:13>,
		<botania:biomestonea14stairs>: <botania:biomestonea:14>,
		<botania:biomestonea15stairs>: <botania:biomestonea:15>,
		<botania:biomestoneb0stairs>: <botania:biomestoneb:0>,
		<botania:biomestoneb1stairs>: <botania:biomestoneb:1>,
		<botania:biomestoneb2stairs>: <botania:biomestoneb:2>,
		<botania:biomestoneb3stairs>: <botania:biomestoneb:3>,
		<botania:biomestoneb4stairs>: <botania:biomestoneb:4>,
		<botania:biomestoneb5stairs>: <botania:biomestoneb:5>,
		<botania:biomestoneb6stairs>: <botania:biomestoneb:6>,
		<botania:biomestoneb7stairs>: <botania:biomestoneb:7>,
		<botania:pavement0stairs>: <botania:pavement:0>,
		<botania:pavement1stairs>: <botania:pavement:1>,
		<botania:pavement2stairs>: <botania:pavement:2>,
		<botania:pavement3stairs>: <botania:pavement:3>,
		<botania:pavement4stairs>: <botania:pavement:4>,
		<botania:pavement5stairs>: <botania:pavement:5>,
		<botania:shimmerrock0stairs>: <botania:shimmerrock>,
		<botania:shimmerwoodplanks0stairs>: <botania:shimmerwoodplanks>,
		<dcs_climate:dcs_stairs_glass>: <dcs_climate:dcs_build_selenite>,
		<dcs_climate:dcs_stairs_gypsum>: <dcs_climate:dcs_ore_gemblock:3>,
		<dcs_climate:dcs_stairs_marble>: <dcs_climate:dcs_ore_gemblock:6>,
		<dcs_climate:dcs_stairs_serpentine>: <dcs_climate:dcs_ore_gemblock:9>,
		<dcs_climate:dcs_stairs_bedrock>: <dcs_climate:dcs_ore_gemblock:12>,
		<dcs_climate:dcs_stairs_dirtbrick>: <dcs_climate:dcs_build_build:7>,
		<dcs_climate:dcs_stairs_skarn>: <dcs_climate:dcs_layer_skarn>,
		<dcs_climate:dcs_stairs_greisen>: <dcs_climate:dcs_layer_skarn:2>,
		<railcraft:creosote_stairs>: <railcraft:creosote_block>,
		//<railcraft:abyssal_brick_stairs>: <railcraft:abyssal:1>,
		<railcraft:badlands_brick_stairs>: <railcraft:badlands:1>,
		<railcraft:bleachedbone_brick_stairs>: <railcraft:bleachedbone:1>,
		<railcraft:bloodstained_brick_stairs>: <railcraft:bloodstained:1>,
		<railcraft:frostbound_brick_stairs>: <railcraft:frostbound:1>,
		<railcraft:infernal_brick_stairs>: <railcraft:infernal:1>,
		<railcraft:jaded_brick_stairs>: <railcraft:jaded:1>,
		<railcraft:pearlized_brick_stairs>: <railcraft:pearlized:1>,
		//<railcraft:quarried_brick_stairs>: <railcraft:quarried:1>,
		<railcraft:sandy_brick_stairs>: <railcraft:sandy:1>,
		//<railcraft:abyssal_paver_stairs>: <railcraft:abyssal:0>,
		<railcraft:badlands_paver_stairs>: <railcraft:badlands:0>,
		<railcraft:bleachedbone_paver_stairs>: <railcraft:bleachedbone:0>,
		<railcraft:bloodstained_paver_stairs>: <railcraft:bloodstained:0>,
		<railcraft:frostbound_paver_stairs>: <railcraft:frostbound:0>,
		<railcraft:infernal_paver_stairs>: <railcraft:infernal:0>,
		<railcraft:jaded_paver_stairs>: <railcraft:jaded:0>,
		<railcraft:pearlized_paver_stairs>: <railcraft:pearlized:0>,
		//<railcraft:quarried_paver_stairs>: <railcraft:quarried:0>,
		<railcraft:sandy_paver_stairs>: <railcraft:sandy:0>,
		<twilightforest:twilight_oak_stairs>: <twilightforest:twilight_oak_planks:0>,
		<twilightforest:canopy_stairs>: <twilightforest:canopy_planks:0>,
		<twilightforest:mangrove_stairs>: <twilightforest:mangrove_planks:0>,
		<twilightforest:dark_stairs>: <twilightforest:dark_planks:0>,
		<twilightforest:time_stairs>: <twilightforest:time_planks:0>,
		<twilightforest:trans_stairs>: <twilightforest:trans_planks:0>,
		<twilightforest:mine_stairs>: <twilightforest:mine_planks:0>,
		<twilightforest:sort_stairs>: <twilightforest:sort_planks:0>,
		<tconstruct:mudbrick_stairs>: <tconstruct:deco_ground>,
		<tconstruct:firewood_stairs>: <tconstruct:firewood:0>,
		<tconstruct:lavawood_stairs>: <tconstruct:firewood:1>,
		<tconstruct:seared_stairs_stone>: <tconstruct:seared:0>,
		<tconstruct:seared_stairs_cobble>: <tconstruct:seared:1>,
		<tconstruct:seared_stairs_paver>: <tconstruct:seared:2>,
		<tconstruct:seared_stairs_brick>: <tconstruct:seared:3>,
		<tconstruct:seared_stairs_brick_cracked>: <tconstruct:seared:4>,
		<tconstruct:seared_stairs_brick_fancy>: <tconstruct:seared:5>,
		<tconstruct:seared_stairs_brick_square>: <tconstruct:seared:6>,
		<tconstruct:seared_stairs_brick_triangle>: <tconstruct:seared:7>,
		<tconstruct:seared_stairs_brick_small>: <tconstruct:seared:8>,
		<tconstruct:seared_stairs_road>: <tconstruct:seared:9>,
		<tconstruct:seared_stairs_tile>: <tconstruct:seared:10>,
		<tconstruct:seared_stairs_creeper>: <tconstruct:seared:11>,
		<tconstruct:dried_clay_stairs>: <tconstruct:dried_clay:0>,
		<tconstruct:dried_brick_stairs>: <tconstruct:dried_clay:1>,
		<tconstruct:brownstone_stairs_smooth>: <tconstruct:brownstone:0>,
		<tconstruct:brownstone_stairs_rough>: <tconstruct:brownstone:1>,
		<tconstruct:brownstone_stairs_paver>: <tconstruct:brownstone:2>,
		<tconstruct:brownstone_stairs_brick>: <tconstruct:brownstone:3>,
		<tconstruct:brownstone_stairs_brick_cracked>: <tconstruct:brownstone:4>,
		<tconstruct:brownstone_stairs_brick_fancy>: <tconstruct:brownstone:5>,
		<tconstruct:brownstone_stairs_brick_square>: <tconstruct:brownstone:6>,
		<tconstruct:brownstone_stairs_brick_triangle>: <tconstruct:brownstone:7>,
		<tconstruct:brownstone_stairs_brick_small>: <tconstruct:brownstone:8>,
		<tconstruct:brownstone_stairs_road>: <tconstruct:brownstone:9>,
		<tconstruct:brownstone_stairs_tile>: <tconstruct:brownstone:10>,
		<tconstruct:brownstone_stairs_creeper>: <tconstruct:brownstone:11>,
	};
	for stair, full in mapStair {
		recipes.remove(stair);
		HiiragiUtils.addShaped(stair*4, [[full, ToolSaw], [full, full]], null, null);
		HiiragiUtils.addShapeless(full*3, [stair, stair, stair, stair], null, null);
	}

	val mapStairTwilight as IItemStack[IItemStack] = {
		<twilightforest:castle_stairs_brick>: <twilightforest:castle_brick:0>,
		<twilightforest:castle_stairs_worn>: <twilightforest:castle_brick:1>,
		<twilightforest:castle_stairs_cracked>: <twilightforest:castle_brick:2>,
		<twilightforest:castle_stairs_mossy>: <twilightforest:castle_brick:4>,
		<twilightforest:castle_stairs:0>: <twilightforest:castle_pillar:0>,
		<twilightforest:castle_stairs:8>: <twilightforest:castle_pillar:3>,
		<twilightforest:nagastone_stairs>: <twilightforest:etched_nagastone>,
		<twilightforest:nagastone_stairs_mossy>: <twilightforest:etched_nagastone_mossy>,
		<twilightforest:nagastone_stairs_weathered>: <twilightforest:etched_nagastone_weathered>,
	};

	for stair, full in mapStairTwilight {
		recipes.remove(stair);
		HiiragiUtils.addShaped(stair*4, [[full, ToolSaw], [full, full]], null, null);
	}


//読み込みの完了をログに出力
print("buildings.zs loaded!");
